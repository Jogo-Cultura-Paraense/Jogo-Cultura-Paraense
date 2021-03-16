import 'dart:ui';

import 'package:flutter/painting.dart';
import 'package:jogo_cultura_paraense/games/artesanato-fauna-flora/find_game4.dart';

class Timer {
  TextPainter painter;
  TextStyle textStyle;
  Offset position;

  double timer;
  final FindGame4 game;

  Timer(this.game) {
    start();
    painter = TextPainter(
      textAlign: TextAlign.left,
      textDirection: TextDirection.ltr,
    );

    textStyle = TextStyle(
      color: Color(0xffffffff),
      fontSize: 24,
      shadows: <Shadow>[
        Shadow(
          blurRadius: 7,
          color: Color(0xff000000),
          offset: Offset(3, 3),
        ),
      ],
    );

    position = Offset.zero;
  }

  void start() {
    timer = 4;
  }

  void update(double t) {
    if (timer > 0) {
      timer -= t;
    }
    if ((painter.text?.text ?? '') != format(timer)) {
      painter.text = TextSpan(
        text: format(timer),
        style: textStyle,
      );

      painter.layout();

      position = Offset(
        (game.tileSize) - (painter.width / 2),
        game.screenSize.height - game.tileSize - (painter.height / 2),
      );
    }
  }

  void render(Canvas c) {
    painter.paint(c, position);
  }

  String format(double n) {
    return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 1);
  }
}
