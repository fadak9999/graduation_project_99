import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 176, 126, 191),
          Color.fromARGB(255, 255, 255, 255),
        ], begin: Alignment.topRight, end: Alignment.center)),
      ),
    );
  }
}
