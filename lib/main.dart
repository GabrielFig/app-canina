import 'package:dog_app/bloc/bloc.dart';
import 'package:dog_app/caracteristicas/repositorio_verificacion.dart';
import 'package:dog_app/caracteristicas/verificaciones/vistas/vista_creandose.dart';
import 'package:dog_app/caracteristicas/verificaciones/vistas/vista_raza_confirmada.dart';
import 'package:dog_app/caracteristicas/verificaciones/vistas/vista_raza_sin_subrazas.dart';
import 'package:dog_app/caracteristicas/verificaciones/vistas/vista_solicitando_raza.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const AplicacionInyectada());
}

class AplicacionInyectada extends StatelessWidget {
  const AplicacionInyectada({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        BlocVerificacion blocVerificacion =
            BlocVerificacion(RepositorioPruebasVerificacion());
        Future.delayed(const Duration(seconds: 2), () {
          blocVerificacion.add(Creado());
        });
        return blocVerificacion;
      },
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
          if (estado is SolicitandoRaza) {
            return const VistaSolicitandoRaza();
          }
          if (estado is MostrandoRazaConfirmada) {
            return VistaRazaConfirmada(estado.registroRaza, estado.nombreRaza);
          }
          if (estado is MostrandoRazaSinSubRazas) {
            return VistaRazaSinSubRazas(estado.nombreRazaSinSubRazas);
          }
          return const Center(
            child: Text("Este mensaje es una alerta"),
          );
        }),
      ),
    );
  }
}
