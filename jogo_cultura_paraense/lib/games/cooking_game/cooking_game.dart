import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/games/cooking_game/order_row.dart';
import 'package:jogo_cultura_paraense/games/cooking_game/tapper_box.dart';
import 'package:jogo_cultura_paraense/games/cooking_game/timer.dart';

class CookingGame extends StatelessWidget {
  const CookingGame({Key key}) : super(key: key);

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
                print('Aqui');
              },
              onWrongTap: () {
                print('Aculá');
              },
              height: 5 * deviceHeight / 6,
              width: deviceWidth,
            ).widget,
          ),
          Container(
            height: deviceHeight / 6,
            width: deviceWidth,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
