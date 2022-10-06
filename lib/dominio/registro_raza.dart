import 'package:fpdart/fpdart.dart';

const String mensajeRegistradoRazaError = "No introdujiste bien el nombre";

class RegistroRaza {
  late final List mensaje;
  late final String status;

  RegistroRaza._(
    this.mensaje,
    this.status,
  );

  factory RegistroRaza.constructor({
    required List propuestaMensaje,
    required String propuestaStatus,
  }) {
    if (propuestaMensaje == "Breed not found (master breed does not exist)") {
      throw mensajeRegistradoRazaError;
    }

    if (propuestaStatus == "error") {
      throw mensajeRegistradoRazaError;
    }

    RegistroRaza._(propuestaMensaje, propuestaStatus);

    final resultado = RegistroRaza._(propuestaMensaje, propuestaStatus);

    return resultado;
  }
}
