import 'package:dog_app/dominio/problemas.dart';
import 'package:dog_app/dominio/registro_raza.dart';
import 'package:dog_app/dominio/variable_dominio.dart';
import 'package:fpdart/fpdart.dart';

abstract class repositoriVerificacion {
  Either<Problema, RegistroRaza> obtenerRegistroRaza(NickFormado nick);
}

List campos = ['status', 'message'];

class RepositorioPruebasVerificacion extends repositoriVerificacion {
  final String _hound =
      """{"message":["afghan","basset","blood","english","ibizan","plott","walker"],"status":"success"} """;

  final String _afrikan = """{"message":[],"status":"success"} """;

  final String _amlo =
      """{"status":"error","message":"Breed not found (master breed does not exist)","code":404} """;

  final String _incorrecto =
      """{"messssage":["afghan","basset","blood","english","ibizan","plott","walker"],"stttatus":"success"} """;

  @override
  Either<Problema, RegistroRaza> obtenerRegistroRaza(NickFormado nick) {
    // TODO: implement obtenerRegistroRaza
    throw UnimplementedError();
  }
}
