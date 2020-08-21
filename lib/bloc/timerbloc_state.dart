part of 'timerbloc_bloc.dart';

@immutable
abstract class TimerblocState extends Equatable {
  final int duration;

  const TimerblocState(this.duration);

  @override
  List<Object> get props => [duration];
}

class TimerInitial extends TimerblocState {
  const TimerInitial(int duration) : super(duration);

  @override
  String toString() => 'TimerInitial { duration: $duration }';
}

class TimerRunPause extends TimerblocState {
  const TimerRunPause(int duration) : super(duration);

  @override
  String toString() => 'TimerRunPause { duration: $duration }';
}

class TimerRunInProgress extends TimerblocState {
  const TimerRunInProgress(int duration) : super(duration);

  @override
  String toString() => 'TimerRunInProgress { duration: $duration }';
}

class TimerRunComplete extends TimerblocState {
  const TimerRunComplete() : super(0);
}
