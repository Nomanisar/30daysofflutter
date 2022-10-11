import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final day = 30;
  final name = "Noman";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catelog App"),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to $day days of flutter by $name"),
        ),
      ),
      drawer: const Drawer(),
    );
  }
}
