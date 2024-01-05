import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_learn/icecream/model/icecream.dart';
import 'package:flutter_learn/icecream/views/icecream_detail_view.dart';
import 'package:flutter_learn/icecream/widgets/icecream_card.dart';

class IcecreamView extends StatelessWidget {
  const IcecreamView({super.key});

  Future<List<Icecream>?> loadIcecreams() async {
    final rawIcecreams = await rootBundle.loadString("assets/icecream.json");
    await Future.delayed(const Duration(seconds: 1));
    final icecreams = icecreamDataFromJson(rawIcecreams);
    return icecreams.icecreams;
  }

  @override
  Widget build(BuildContext context) {
    // final Orientation orientation = MediaQuery.of(context).orientation;
    // final bool isLandscape = orientation == Orientation.landscape;
    return Scaffold(
      backgroundColor: const Color(0xFFF9F1F0),
      // primary: !isLandscape,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FutureBuilder(
                future: loadIcecreams(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    final icecreams = snapshot.data as List<Icecream>;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width,
                          height: MediaQuery.sizeOf(context).height / 2.5,
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              final icecream = icecreams[index];
                              return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            IcecreamDetailView(
                                          icecream: icecream,
                                        ),
                                      ),
                                    );
                                  },
                                  child: IcecreamCard(icecream: icecream));
                            },
                            scrollDirection: Axis.horizontal,
                            itemCount: icecreams.length,
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const Center(
                        child: CircularProgressIndicator.adaptive());
                  }
                })
          ],
        ),
      ),
    );
  }
}
