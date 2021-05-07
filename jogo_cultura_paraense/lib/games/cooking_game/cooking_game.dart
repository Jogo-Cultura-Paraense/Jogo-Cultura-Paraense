import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jogo_cultura_paraense/games/cooking_game/bloc/cooking_game_bloc.dart';
import 'package:jogo_cultura_paraense/games/cooking_game/cooking_game_scaffold.dart';
import 'package:jogo_cultura_paraense/games/cooking_game/cooking_game_tutorial.dart';

class CookingGame extends StatelessWidget {
  const CookingGame({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CookingGameBloc, CookingGameState>(
      buildWhen: (previousState, currentState) {
        if (currentState.status != CookingGameStatus.finished &&
            currentState.status != previousState.status) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        return state.status == CookingGameStatus.ready
            ? const CookingGameTutorial()
            : const CookingGameScaffold();
      },
    );
  }
}
