import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jogo_cultura_paraense/games/cooking_game/bloc/cooking_game_bloc.dart';
import 'package:jogo_cultura_paraense/games/cooking_game/models/order.dart';
import 'package:jogo_cultura_paraense/games/cooking_game/order_row.dart';
import 'package:jogo_cultura_paraense/games/cooking_game/tapper_box.dart';
import 'package:jogo_cultura_paraense/games/cooking_game/timer.dart';

class CookingGame extends StatelessWidget {
  final int timeLimit;
  final List<Order> _orders;
  final int hints;
  CookingGame(this.timeLimit, List<Order> orders, this.hints, {Key key})
      : _orders = orders,
        super(key: key);

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
          Timer(timeLimit: timeLimit),
          OrderRow(
            height: deviceHeight / 6,
            width: deviceWidth,
          ),
          Expanded(
            child: TapperBox(
              orders: _orders,
              hints: hints,
              height: 3 * deviceHeight / 5,
              width: deviceWidth,
              top: deviceHeight / 6,
              onCorrectTap: (String ingredientId) {
                BlocProvider.of<CookingGameBloc>(context).add(
                  RemoveIngredient(ingredientId),
                );
              },
              onHintTap: () {
                BlocProvider.of<CookingGameBloc>(context).add(
                  RemoveTopIngredients(5),
                );
              },
            ).widget,
          ),
          Container(
            height: deviceHeight / 6,
            width: deviceWidth / 2,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
