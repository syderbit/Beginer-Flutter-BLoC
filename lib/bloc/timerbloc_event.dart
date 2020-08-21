part of 'timerbloc_bloc.dart';

@immutable
abstract class TimerblocEvent extends Equatable {
  const TimerblocEvent();

  @override
  List<Object> get props => [];
}

class TimerStarted extends TimerblocEvent {
  final int duration;

  const TimerStarted({@required this.duration});

  @override
  String toString() => "TimerStarted { duration: $duration }";
}

class TimerPaused extends TimerblocEvent {}

class TimerResumed extends TimerblocEvent {}

class TimerReset extends TimerblocEvent {}

class TimerTicked extends TimerblocEvent {
  final int duration;

  const TimerTicked({@required this.duration});

  @override
  List<Object> get props => [duration];

  @override
  String toString() => "TimerTicked { duration: $duration }";
}
