import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ScoreDisplay {
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
  final double _screenWidth;
  final double _tileSize;

  Offset _position = Offset.zero;
  int _score = 0;

  int get score => _score;

  ScoreDisplay({
    @required double screenWidth,
    @required double tileSize,
  })  : _screenWidth = screenWidth,
        _tileSize = tileSize {
    updateScore(0);
  }

  void updateScore(int update) {
    _score += update;
    _painter.text = TextSpan(text: 'PLACAR: $_score', style: _textStyle);
    _painter.layout();

    _position = Offset(
      _screenWidth - (_tileSize * .25) - _painter.width,
      _tileSize * .25,
    );
  }

  void render(Canvas canvas) {
    _painter.paint(canvas, _position);
  }
}
