import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:jogo_cultura_paraense/games/running_game/models/legend.dart';
import 'package:jogo_cultura_paraense/games/running_game/models/rules.dart';
import 'package:meta/meta.dart';

part 'running_game_event.dart';
part 'running_game_state.dart';

class RunningGameBloc extends Bloc<RunningGameEvent, RunningGameState> {
  RunningGameBloc(RunningGameRules rules)
      : super(RunningGameState.initFromRules(rules: rules));

  @override
  Stream<RunningGameState> mapEventToState(RunningGameEvent event) async* {
    if (event is StartGame) {
      yield state.copyWith(status: RunningGameStatus.running);
    } else if (event is RemoveLegend) {
      final newLegends = List<Legend>.from(state.legends);
      // Remove a legend
      newLegends.removeWhere((legend) => legend.id == event.legendId);
      yield state.copyWith(
        status: newLegends.isEmpty ? RunningGameStatus.finished : state.status,
        legends: newLegends,
      );
    } else if (event is RemoveLife) {
      final newLife = state.lifes - 1;
      yield state.copyWith(
        status: newLife <= 0 ? RunningGameStatus.finished : state.status,
        lifes: newLife,
      );
    } else if (event is RemoveTopLegend) {
      final newLegends = state.legends;
      newLegends.removeAt(0);
      yield state.copyWith(
        status: newLegends.isEmpty ? RunningGameStatus.finished : state.status,
        legends: newLegends,
        hints: state.hints + 1,
      );
    } else if (event is FinishGame) {
      yield state.copyWith(status: RunningGameStatus.finished);
    }
  }
}
