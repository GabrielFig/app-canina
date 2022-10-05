import 'package:dog_app/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:bloc/bloc.dart';

void main() {
  blocTest<BlocVerificacion, Estado>(
    'evento= Creado estado=SolicitandoRaza',
    build: () => BlocVerificacion(),
    act: (bloc) => bloc.add(Creado()),
    expect: () => [isA<SolicitandoRaza>()],
  );
}
