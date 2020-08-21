part of 'prosesb_cubit.dart';

@immutable
abstract class ProsesbState {}

class ProsesbInitial extends ProsesbState {}

class ProsesaDataBOutput extends ProsesbState {
  final dynamic outputCubit;

  ProsesaDataBOutput(this.outputCubit);
}
