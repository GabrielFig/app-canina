import 'package:dog_app/bloc/bloc.dart';
import 'package:dog_app/caracteristicas/verificaciones/vistas/vista_creandose.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const Aplicacion());
}

class AplicacionInyectada extends StatelessWidget {
  const AplicacionInyectada({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlocVerificacion(),
      child: const Aplicacion(),
    );
  }
}

class Aplicacion extends StatelessWidget {
  const Aplicacion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Builder(builder: (context) {
          var estado = context.watch<BlocVerificacion>().state;

          if (estado is Creandose) {
            return const VistaCreandose();
          }
          return const Center(
            child: Text("Este mensaje es una alerta"),
          );
        }),
      ),
    );
  }
}
