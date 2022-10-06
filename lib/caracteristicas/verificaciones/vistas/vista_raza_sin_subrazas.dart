import 'package:dog_app/bloc/bloc.dart';
import 'package:dog_app/dominio/variable_dominio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VistaRazaSinSubRazas extends StatelessWidget {
  final NickFormado nombreRazaSinSubRazas;
  const VistaRazaSinSubRazas(this.nombreRazaSinSubRazas, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('Raza: ${nombreRazaSinSubRazas.valor}'),
          Text('Esta raza no tiene sub razas'),
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
