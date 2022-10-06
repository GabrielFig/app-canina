import 'package:dog_app/bloc/bloc.dart';
import 'package:dog_app/dominio/registro_raza.dart';
import 'package:dog_app/dominio/variable_dominio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VistaRazaConfirmada extends StatelessWidget {
  final RegistroRaza registroRaza;
  final NickFormado nombreRaza;
  const VistaRazaConfirmada(this.registroRaza, this.nombreRaza, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('Nombre: ${nombreRaza.valor}'),
          Text('SubRazas: ${registroRaza.mensaje}'),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: () {
              final elBloc = context.read<BlocVerificacion>();
              elBloc.add(Creado());
            },
            child: const Text('Regresar'),
          ),
        ],
      ),
    );
  }
}
