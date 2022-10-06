import 'package:flutter/material.dart';

class VistaSolicitandoRaza extends StatelessWidget {
  const VistaSolicitandoRaza({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Dame una raza"),
        const TextField(),
        TextButton(onPressed: () {}, child: const Text("algo"))
      ],
    );
  }
}
