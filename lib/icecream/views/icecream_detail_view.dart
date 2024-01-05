import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../model/icecream.dart';

class IcecreamDetailView extends StatelessWidget {
  const IcecreamDetailView({super.key, required this.icecream});

  final Icecream icecream;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F1F0),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF79489),
        title: Text(
          icecream.flavor,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Color(0xFFF9F1F0)),
        ),
        elevation: 0.0,
        iconTheme: const IconThemeData(
          color: Color(0xFFF9F1F0),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Hero(
                    tag: icecream.image!,
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 100,
                      backgroundImage: CachedNetworkImageProvider(
                          icecream.image!,
                          cacheKey: icecream.image!),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "\$ ${icecream.price.toString()}",
                    style: const TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFF79489)),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                icecream.description!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF79489),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Toppings",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF79489),
                ),
              ),
              SizedBox(
                height: 70,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                      child: Chip(
                        label: Text(
                          icecream.toppings![index],
                          style: const TextStyle(
                              color: Color(0xFFF9F1F0),
                              fontWeight: FontWeight.bold),
                        ),
                        backgroundColor: const Color(0xFFF79489),
                      ),
                    );
                  },
                  itemCount: icecream.toppings!.length,
                ),
              ),
              const Text(
                "Ingredients",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF79489)),
              ),
              const SizedBox(height: 10),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final ing = icecream.ingredients[index];
                  return Card(
                    color: const Color(0xFFF8AFA6),
                    child: ListTile(
                      title: Text(
                        ing.name,
                        style: const TextStyle(color: Color(0xFFF9F1F0)),
                      ),
                      subtitle: Text(
                        "Quantity: ${ing.quantity}",
                        style: const TextStyle(color: Color(0xFFFADCD9)),
                      ),
                    ),
                  );
                },
                itemCount: icecream.ingredients.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
