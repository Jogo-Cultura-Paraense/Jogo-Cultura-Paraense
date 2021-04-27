import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/games/musica/musica_game.dart';

class HitText {
  final MusicaGame game;
  final TextPainter _painter = TextPainter(
    textAlign: TextAlign.center,
    textDirection: TextDirection.ltr,
  );
  final TextStyle _textStyle = TextStyle(
    color: Color(0xffffffff),
    fontSize: 24,
    shadows: List<Shadow>.generate(
      4,
      (index) => Shadow(
        blurRadius: 3,
        color: Color(0xff000000),
        offset: Offset.zero,
      ),
    ),
  );
  Offset _position = Offset.zero;
  final String text;
  double timer;
  final Offset center;

  HitText(this.game, this.text, this.center) {
    timer = 0;
  }

  void update(double t) {
    timer += t;
    _painter.text = TextSpan(
      text: text,
      style: _textStyle,
    );
    _painter.layout();

    _position = center;
  }

  void render(Canvas c) {
    _painter.paint(c, _position);
  }
}
