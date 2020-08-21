import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'prosesb_state.dart';

class ProsesbCubit extends Cubit<ProsesbState> {
  ProsesbCubit() : super(ProsesbInitial());

  void prosesBInput(dynamic value) {
    //print('${(state is ProsesaDataBOutput)} ==> $value');
    emit((state is ProsesaDataBOutput)
        ? (value == null || value == '')
            ? ProsesaDataBOutput("Tidak ada argument.")
            : ProsesaDataBOutput(value)
        : ProsesaDataBOutput("Tidak ada argument."));
  }
}
