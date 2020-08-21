part of 'cuaca_bloc.dart';

abstract class CuacaEvent extends Equatable {
  const CuacaEvent();
}

class RequestCuaca extends CuacaEvent {
  final String city;

  //=>> assert menandakan tidak boleh kosong
  const RequestCuaca({@required this.city}) : assert(city != null);

  @override
  List<Object> get props => [city];
}
