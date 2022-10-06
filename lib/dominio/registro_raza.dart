import 'package:fpdart/fpdart.dart';

const String mensajeRegistradoRazaError = "No introdujiste bien el nombre";

class RegistroRaza {
  late final String nombreRaza;
  late final Either<String, List<String>> subRazas;

  RegistroRaza._(this.nombreRaza, this.subRazas);

  factory RegistroRaza.constructor(
      {required String propuestaRaza,
      required List<String> propuestaSubRazas}) {
    Either<String, List<String>> checkSubRazas_(List<String> posiblesSubRazas) {
      if (posiblesSubRazas.isEmpty) {
        return const Left("Raza sin sub razas");
      }
      return Right(posiblesSubRazas);
    }

    if (propuestaRaza.trim().isEmpty) {
      throw Right(mensajeRegistradoRazaError);
    }
    var estadoSubRaza = checkSubRazas_(propuestaSubRazas);
    return RegistroRaza._(propuestaRaza, estadoSubRaza);
  }
}
