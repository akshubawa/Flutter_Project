import 'package:flutter/material.dart';
import 'package:flutter_learn/app/home_view.dart';
import 'package:google_fonts/google_fonts.dart';

// Stateless Widget is immutable. (can't be changed)
// Stateful Widget is mutable. (can be changed)

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Flutter Learn",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
          fontFamily: GoogleFonts.dmSans().fontFamily,
        ),
        home: const HomeView());
  }
}
