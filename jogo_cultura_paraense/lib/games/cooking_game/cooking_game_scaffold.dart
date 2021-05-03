import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jogo_cultura_paraense/games/cooking_game/bloc/cooking_game_bloc.dart';
import 'package:jogo_cultura_paraense/games/cooking_game/order_row.dart';
import 'package:jogo_cultura_paraense/games/cooking_game/tapper_box.dart';
import 'package:jogo_cultura_paraense/games/cooking_game/timer.dart';

class CookingGameScaffold extends StatelessWidget {
  const CookingGameScaffold({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    // ignore: close_sinks
    final bloc = BlocProvider.of<CookingGameBloc>(context);

    return Container(
      height: deviceHeight,
      width: deviceWidth,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/cooking_game/bg.jpeg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Timer(timeLimit: bloc.state.rules.time),
          OrderRow(
            height: deviceHeight / 6,
            width: deviceWidth,
          ),
          Expanded(
            child: TapperBox(
              orders: bloc.state.orders,
              hints: bloc.state.rules.hints,
              height: 3 * deviceHeight / 5,
              width: deviceWidth,
              top: deviceHeight / 6,
              onCorrectTap: (String ingredientId) {
                bloc.add(RemoveIngredient(ingredientId));
              },
              onHintTap: () {
                bloc.add(RemoveTopIngredients(5));
              },
            ).widget,
          ),
          Container(
            height: deviceHeight / 6,
            width: deviceWidth / 2,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/cooking_game/panela.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
