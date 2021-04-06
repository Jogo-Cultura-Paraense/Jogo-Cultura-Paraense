import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jogo_cultura_paraense/games/cooking_game/bloc/cooking_game_bloc.dart';
import 'package:jogo_cultura_paraense/games/cooking_game/order_row.dart';
import 'package:jogo_cultura_paraense/games/cooking_game/tapper_box.dart';
import 'package:jogo_cultura_paraense/games/cooking_game/timer.dart';
import 'package:jogo_cultura_paraense/games/models/order.dart';
import 'package:jogo_cultura_paraense/games/models/recipe.dart';

class CookingGame extends StatelessWidget {
  const CookingGame({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return CookingGameBloc(<Order>[
          Order.fromRecipe(Recipes.casquinhaDeCarangueijo),
          Order.fromRecipe(Recipes.casquinhaDeCarangueijo),
          Order.fromRecipe(Recipes.casquinhaDeCarangueijo),
          Order.fromRecipe(Recipes.casquinhaDeCarangueijo),
          Order.fromRecipe(Recipes.casquinhaDeCarangueijo),
        ]);
      },
      child: const CookingGameScaffold(),
    );
  }
}

class CookingGameScaffold extends StatelessWidget {
  const CookingGameScaffold({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      height: deviceHeight,
      width: deviceWidth,
      decoration: BoxDecoration(color: Colors.grey[200]),
      child: Column(
        children: [
          const Timer(),
          OrderRow(
            height: deviceHeight / 6,
            width: deviceWidth,
          ),
          Expanded(
            child: TapperBox(
              onRightTap: () {
                BlocProvider.of<CookingGameBloc>(context)
                    .add(RemoveIngredient());
              },
              onWrongTap: () {
                print('Aculá');
              },
              height: 3 * deviceHeight / 6,
              width: deviceWidth,
              top: deviceHeight / 6,
            ).widget,
          ),
          // Container(
          //   height: deviceHeight / 6,
          //   width: deviceWidth,
          //   color: Colors.blue,
          // ),
        ],
      ),
    );
  }
}
