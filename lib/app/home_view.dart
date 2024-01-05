import 'package:flutter/material.dart';
import 'package:flutter_learn/icecream/views/icecream_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFFF79489),
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Icecreams",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF9F1F0))),
              Text(
                "Yummy and Delicious!",
                style: TextStyle(fontSize: 12, color: Color(0xFFFADCD9)),
              ),
            ],
          )),
      body: const SafeArea(
        bottom: true,
        child: IcecreamView(),
      ),
    );
  }
}
