part of 'running_game_bloc.dart';

@immutable
abstract class RunningGameEvent {}

class StartGame extends RunningGameEvent {}

class RemoveLegend extends RunningGameEvent {
  final String legendId;

  RemoveLegend(this.legendId);
}

class RemoveLife extends RunningGameEvent {
  RemoveLife();
}

class RemoveTopLegend extends RunningGameEvent {
  RemoveTopLegend();
}

class FinishGame extends RunningGameEvent {}
