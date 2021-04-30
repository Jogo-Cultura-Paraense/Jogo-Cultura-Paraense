import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/games/musica/musica_game.dart';

class Timer {
  final MusicaGame game;
  final TextPainter _painter = TextPainter(
    textAlign: TextAlign.center,
    textDirection: TextDirection.ltr,
  );
  final double _tileSize;
  final double _screenHeight;
  Offset _position = Offset.zero;
  double _time;

  Timer(
    double startTime,
    this.game, {
    @required double screenHeight,
    @required double tileSize,
  })  : _time = startTime,
        _tileSize = tileSize,
        _screenHeight = screenHeight;

  double get currentTime => _time;

  void updateTime(double t) {
    _time += t;
  }

  void update(double t) {
    //if (_time > 0) updateTime(-t);
    _time++;
    if ((_painter.text?.toPlainText() ?? '') != format(_time)) {
      _painter.text = TextSpan(
        text: format(_time),
        style: TextStyle(
          color: Color(0xffffffff),
          fontSize: 24,
          shadows: <Shadow>[
            Shadow(
              blurRadius: 7,
              color: Color(0xff000000),
              offset: Offset(3, 3),
            ),
          ],
        ),
      );

      _painter.layout();

      _position = Offset(
        (_tileSize) - (_painter.width / 2),
        _screenHeight - _tileSize - (_painter.height / 2),
      );
    }
  }

  void render(Canvas canvas) {
    _painter.paint(canvas, _position);
  }

  String format(double n) {
    return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 1);
  }
}
