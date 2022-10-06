import 'package:bloc/bloc.dart';
import 'package:dog_app/caracteristicas/repositorio_verificacion.dart';
import 'package:dog_app/dominio/problemas.dart';
import 'package:dog_app/dominio/registro_raza.dart';
import 'package:dog_app/dominio/variable_dominio.dart';

class Evento {}

class Creado extends Evento {}

class NombreRazaRecibido extends Evento {
  final NickFormado nick;
  NombreRazaRecibido(this.nick);
}

class MostrandoRazaConfirmada extends Estado {
  final RegistroRaza registroRaza;
  final NickFormado nombreRaza;

  MostrandoRazaConfirmada(this.registroRaza, this.nombreRaza);
}

class MostrandoRazaNoConfirmada extends Estado {
  final NickFormado nombreRazaNoCofirmada;

  MostrandoRazaNoConfirmada(this.nombreRazaNoCofirmada);
}

class MostrandoRazaSinSubRazas extends Estado {
  final NickFormado nombreRazaSinSubRazas;

  MostrandoRazaSinSubRazas(this.nombreRazaSinSubRazas);
}

class RazaRecibida extends Evento {}

class RazaConfirmada extends Evento {}

class Estado {}

class Creandose extends Estado {}

class SolicitandoRaza extends Estado {}

class EsperandoConfirmacionRaza extends Estado {}

class MostrandoSolicitudActualizacion extends Estado {}

class BlocVerificacion extends Bloc<Evento, Estado> {
  final repositoriVerificacion _repositorioVerificacion;
  BlocVerificacion(this._repositorioVerificacion) : super(Creandose()) {
    on<Creado>((event, emit) {
      emit(SolicitandoRaza());
    });

    on<NombreRazaRecibido>((event, emit) {
      emit(EsperandoConfirmacionRaza());
      final resultado =
          _repositorioVerificacion.obtenerRegistroRaza(event.nick);
      resultado.match((l) {
        if (l is VersionIncorrectaJson) emit(MostrandoSolicitudActualizacion());
        if (l is RazaNoEncontrada) emit(MostrandoRazaNoConfirmada(event.nick));
        if (l is SubRazasNoEncontradas)
          emit(MostrandoRazaSinSubRazas(event.nick));
      }, (r) {
        emit(MostrandoRazaConfirmada(r, event.nick));
      });
    });
  }
}
