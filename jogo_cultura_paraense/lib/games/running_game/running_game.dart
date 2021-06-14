import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jogo_cultura_paraense/games/running_game/bloc/running_game_bloc.dart';
import 'package:jogo_cultura_paraense/games/running_game/running_game_scaffold.dart';
import 'package:jogo_cultura_paraense/games/running_game/running_game_tutorial.dart';

class RunningGame extends StatelessWidget {
  const RunningGame({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RunningGameBloc, RunningGameState>(
      buildWhen: (previousState, currentState) {
        if (currentState.status != RunningGameStatus.finished &&
            currentState.status != previousState.status) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        return state.status == RunningGameStatus.ready
            ? const RunningGameTutorial()
            : const RunningGameScaffold();
      },
    );
  }
}
