import 'dart:convert';

import 'package:dog_app/dominio/problemas.dart';
import 'package:dog_app/dominio/registro_raza.dart';
import 'package:dog_app/dominio/variable_dominio.dart';
import 'package:fpdart/fpdart.dart';

abstract class repositoriVerificacion {
  Either<Problema, RegistroRaza> obtenerRegistroRaza(NickFormado nick);
}

List campos = ['status', 'message'];

class RepositorioPruebasVerificacion extends repositoriVerificacion {
  final String _poodle =
      """{"message":["medium","miniature","standard","toy"],"status":"success"} """;

  final String _afrikan = """{"message":[],"status":"success"} """;

  final String _amlo =
      """{"status":"error","message":"Breed not found (master breed does not exist)","code":404} """;

  final String _incorrecto =
      """{"messssage":["afghan","basset","blood","english","ibizan","plott","walker"],"stttatus":"success"} """;

  @override
  Either<Problema, RegistroRaza> obtenerRegistroRaza(NickFormado nick) {
    if (nick.valor == 'hound') {
      return obtenerRegistroUsuarioDesdeJSON(_poodle);
    }
    if (nick.valor == 'afrikan') {
      return obtenerRegistroUsuarioDesdeJSON(_afrikan);
    }
    if (nick.valor == 'amlo') {
      return obtenerRegistroUsuarioDesdeJSON(_amlo);
    }
    if (nick.valor == 'incorrecto') {
      return Left(VersionIncorrectaJson());
    }

    return Left(RazaNoEncontrada());
  }
}

Either<Problema, RegistroRaza> obtenerRegistroUsuarioDesdeJSON(
    String docuemnto) {
  Map<String, dynamic> resultado = jsonDecode(docuemnto);

  if (resultado['status'] == "error") {
    return left(RazaNoEncontrada());
  }

  if (resultado['message'].isEmpty) {
    return left(SubRazasNoEncontradas());
  }

  return Right(RegistroRaza.constructor(
      propuestaMensaje: resultado['message'],
      propuestaStatus: resultado['status']));
}
