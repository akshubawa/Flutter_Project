import 'package:flutter/material.dart';
import 'package:flutter_learn/views/home_view.dart';

// Stateless Widget is immutable. (can't be changed)
// Stateful Widget is mutable. (can be changed)

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: "Flutter Learn",
        home: HomeView());
  }
}
