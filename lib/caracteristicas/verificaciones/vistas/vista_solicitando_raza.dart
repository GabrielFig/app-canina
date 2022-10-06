import 'package:flutter/src/widgets/framework.dart';
import 'package:dog_app/bloc/bloc.dart';
import 'package:dog_app/dominio/variable_dominio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VistaSolicitandoRaza extends StatefulWidget {
  const VistaSolicitandoRaza({Key? key}) : super(key: key);

  @override
  State<VistaSolicitandoRaza> createState() => _VistaSolicitandoRazaState();
}

class _VistaSolicitandoRazaState extends State<VistaSolicitandoRaza> {
  bool _nombreRazaValidado = false;
  late final TextEditingController controlador;

  @override
  void initState() {
    controlador = TextEditingController();
    controlador.addListener(escuchadorValidador);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controlador.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final elBloc = context.read<BlocVerificacion>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter',
            ),
            controller: controlador,
          ),
          Container(
            child: _nombreRazaValidado
                ? null
                : TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.grey),
                    ),
                    onPressed: null,
                    child: const Text('Buscar Raza'),
                  ),
          ),
          Container(
            child: !_nombreRazaValidado
                ? null
                : TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () {
                      elBloc.add(
                        NombreRazaRecibido(
                          NickFormado.constructor(controlador.text),
                        ),
                      );
                    },
                    child: const Text('Buscar Raza'),
                  ),
          ),
        ],
      ),
    );
  }

  void escuchadorValidador() {
    setState(() {
      try {
        NickFormado.constructor(controlador.text);
        _nombreRazaValidado = true;
      } catch (e) {
        _nombreRazaValidado = false;
      }
    });
  }
}
