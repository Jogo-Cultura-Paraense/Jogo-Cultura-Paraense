import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jogo_cultura_paraense/games/running_game/bloc/running_game_bloc.dart';
import 'package:jogo_cultura_paraense/games/running_game/models/rules.dart';
import 'package:jogo_cultura_paraense/games/running_game/running_game.dart';

class RunningGamePage extends StatelessWidget {
  static const String routeName = '/running_game';
  final RunningGameBloc _bloc;

  RunningGamePage({@required RunningGameRules rules, Key key})
      : _bloc = RunningGameBloc(rules),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: const RunningGame(),
    );
  }
}
