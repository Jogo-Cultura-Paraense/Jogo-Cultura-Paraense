import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/games/cooking_game/cooking_game.dart';

class CookingGamePage extends StatelessWidget {
  static const String routeName = '/cooking_game';

  const CookingGamePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CookingGame();
  }
}
