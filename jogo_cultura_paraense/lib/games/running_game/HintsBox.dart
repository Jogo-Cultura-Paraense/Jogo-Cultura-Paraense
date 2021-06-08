import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jogo_cultura_paraense/games/running_game/bloc/running_game_bloc.dart';

class HintsBox extends StatelessWidget {
  const HintsBox({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RunningGameBloc, RunningGameState>(
      buildWhen: (previousState, nextState) {
        if (previousState.hints > nextState.hints) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
          ),
          child: Icon(
            state.hints > 0 ? Icons.block_outlined : Icons.lightbulb_outline,
            size: 45.0,
            color: Colors.white,
          ),
        );
      },
    );
  }
}
