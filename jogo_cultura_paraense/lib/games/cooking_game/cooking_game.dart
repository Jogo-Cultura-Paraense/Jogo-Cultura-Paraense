import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/games/cooking_game/order_row.dart';
import 'package:jogo_cultura_paraense/games/cooking_game/tapper_widget.dart';
import 'package:jogo_cultura_paraense/games/cooking_game/timer.dart';

class CookingGame extends StatelessWidget {
  final int timeLimit;
  const CookingGame(this.timeLimit, {Key key}) : super(key: key);

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
            child: TapperWidget(
              height: 3 * deviceHeight / 5,
              width: deviceWidth,
              top: deviceHeight / 6,
            ),
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
