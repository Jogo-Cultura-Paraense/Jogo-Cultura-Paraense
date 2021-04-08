import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jogo_cultura_paraense/games/cooking_game/bloc/cooking_game_bloc.dart';
import 'package:jogo_cultura_paraense/games/cooking_game/cooking_game.dart';
import 'package:jogo_cultura_paraense/games/cooking_game/cooking_game_rules.dart';

class CookingGamePage extends StatelessWidget {
  static const String routeName = '/cooking_game';

  const CookingGamePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CookingGamePageArgs args =
        ModalRoute.of(context).settings.arguments ??
            CookingGamePageArgs.initial();

    return BlocProvider(
      create: (context) => CookingGameBloc(args.rules.allOrders),
      child: CookingGame(args.rules.time),
    );
  }
}

class CookingGamePageArgs {
  final CookingGameRules rules;

  const CookingGamePageArgs(this.rules);

  factory CookingGamePageArgs.initial() {
    return CookingGamePageArgs(CookingGameRules1());
  }
}
