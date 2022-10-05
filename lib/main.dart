import 'package:flutter/material.dart';

void main() {
  runApp(const Aplicacion());
}

class Aplicacion extends StatelessWidget {
  const Aplicacion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Builder(builder: (context) {
          return const Text("Este es un texto de aviso");
        }),
      ),
    );
  }
}
