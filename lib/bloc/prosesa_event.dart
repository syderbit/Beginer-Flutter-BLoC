part of 'prosesa_bloc.dart';

//==> Input from UI;

@immutable
abstract class ProsesaEvent {}

class ProcesaDataInput extends ProsesaEvent {
  final dynamic input;

  ProcesaDataInput(this.input);
}
