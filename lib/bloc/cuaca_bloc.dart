import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
part 'cuaca_event.dart';
part 'cuaca_state.dart';

class CuacaBloc extends Bloc<CuacaEvent, CuacaState> {
  CuacaBloc() : super(CuacaInitial());

  @override
  Stream<CuacaState> mapEventToState(
    CuacaEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
