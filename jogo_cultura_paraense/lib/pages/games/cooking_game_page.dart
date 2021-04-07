import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jogo_cultura_paraense/games/cooking_game/bloc/cooking_game_bloc.dart';
import 'package:jogo_cultura_paraense/games/cooking_game/cooking_game.dart';
import 'package:jogo_cultura_paraense/games/models/order.dart';
import 'package:jogo_cultura_paraense/games/models/recipe.dart';

class CookingGamePage extends StatelessWidget {
  static const String routeName = '/cooking_game';

  const CookingGamePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orders = <Order>[
      Order.fromRecipe(Recipes.casquinhaDeCarangueijo),
      Order.fromRecipe(Recipes.casquinhaDeCarangueijo),
      Order.fromRecipe(Recipes.casquinhaDeCarangueijo),
      Order.fromRecipe(Recipes.casquinhaDeCarangueijo),
      Order.fromRecipe(Recipes.casquinhaDeCarangueijo),
    ];

    return BlocProvider(
      create: (context) => CookingGameBloc(orders),
      child: const CookingGame(),
    );
  }
}
