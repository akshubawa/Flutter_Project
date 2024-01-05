import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/icecream/model/icecream.dart';

class IcecreamCard extends StatelessWidget {
  const IcecreamCard({
    super.key,
    required this.icecream,
  });

  final Icecream icecream;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width / 1.5,
      height: MediaQuery.sizeOf(context).height / 2,
      child: Card(
        clipBehavior: Clip.hardEdge,
        color: const Color(0xFFF8AFA6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Hero(
              tag: icecream.image!,
              child: CachedNetworkImage(
                imageUrl: icecream.image!,
                cacheKey: icecream.image!,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                padding: const EdgeInsets.all(12.0),
                decoration: const BoxDecoration(
                    color: Color(0xFFF8AFA6),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(16),
                        topRight: Radius.circular(16))),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        icecream.flavor,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFF9F1F0),
                            fontSize: 18),
                      ),
                      Text(
                        "\$ ${icecream.price}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFF9F1F0),
                            fontSize: 17),
                      ),
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
