part of 'prosesa_bloc.dart';

//==> Output to UI;
@immutable
abstract class ProsesaState {}

class ProsesaInitial extends ProsesaState {}

class ProsesaDataAOutput extends ProsesaState {
  final dynamic output;

  ProsesaDataAOutput(this.output);
}
