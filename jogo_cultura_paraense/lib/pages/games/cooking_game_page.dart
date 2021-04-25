import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jogo_cultura_paraense/games/cooking_game/bloc/cooking_game_bloc.dart';
import 'package:jogo_cultura_paraense/games/cooking_game/cooking_game.dart';
import 'package:jogo_cultura_paraense/games/cooking_game/cooking_game_rules.dart';

class CookingGamePage extends StatelessWidget {
  static const String routeName = '/cooking_game';
  final CookingGameBloc _bloc;

  CookingGamePage({
    @required CookingGameRules rules,
    Key key,
  })  : _bloc = CookingGameBloc(rules),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: CookingGame(
        _bloc.state.rules.time,
        _bloc.state.orders,
        _bloc.state.rules.hints,
      ),
    );
  }
}
