import 'package:bloc/bloc.dart';

class Evento {}

class Creado extends Evento {}

class RazaRecibida extends Evento {}

class RazaConfirmada extends Evento {}

class Estado {}

class Creandose extends Estado {}

class SolicitandoRaza extends Estado {}

class BlocVerificacion extends Bloc<Evento, Estado> {
  BlocVerificacion() : super(Creandose()) {
    on<Creado>((event, emit) {
      emit(SolicitandoRaza());
    });
  }
}
