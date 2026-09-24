import 'package:flutter/material.dart';

void main() {
  runApp(const Marcador());
}

class Marcador extends StatelessWidget {
  const Marcador({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: Scaffold(SafeArea()),
    );
  }
}
