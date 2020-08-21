import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'prosesa_event.dart';
part 'prosesa_state.dart';

//==> Processing data from UI via EVENT & Back to UI via STATE
class ProsesaBloc extends Bloc<ProsesaEvent, ProsesaState> {
  ProsesaBloc() : super(ProsesaInitial());

  @override
  Stream<ProsesaState> mapEventToState(ProsesaEvent event) async* {
    if (event is ProcesaDataInput) {
      yield event.input.toString() == ''
          ? ProsesaDataAOutput("Tidak ada argument.")
          : ProsesaDataAOutput(event.input);

      /* yield (state is ProsesaInitial)
          ? ProsesaDataAOutput("Tidak ada argument.")
          : event.input.toString() == ''
              ? ProsesaDataAOutput("Tidak ada argument.")
              : ProsesaDataAOutput(event.input); */
    }
  }
}
