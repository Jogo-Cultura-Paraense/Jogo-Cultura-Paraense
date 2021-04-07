import 'dart:math';

import 'package:flutter/material.dart';

class IngredientSprite {
  static const directions = [1, -1];

  final int id;
  final String ingredientId;
  Paint _paint = Paint();
  Rect _rect;
  Rect _tappeable;
  int _vertical;
  int _horizontal;

  IngredientSprite({
    @required this.id,
    @required this.ingredientId,
    @required double x,
    @required double y,
    @required double size,
    String sprite = "0xFFF44336",
  })  : _rect = Rect.fromCenter(
          center: Offset(x, y),
          width: size,
          height: size,
        ),
        _tappeable = Rect.fromCenter(
          center: Offset(x, y),
          width: size + 10,
          height: size + 10,
        ) {
    _paint.color = Color(int.parse(sprite));
    final rnd = Random();
    _vertical = IngredientSprite.directions[rnd.nextInt(2)];
    _horizontal = IngredientSprite.directions[rnd.nextInt(2)];
  }

  bool contains(Offset d) => _tappeable.contains(d);

  double get left => _rect.left;
  double get right => _rect.right;
  double get bottom => _rect.bottom;
  double get top => _rect.top;

  void render(Canvas canvas) {
    canvas.drawRect(_rect, _paint);
  }

  void changeVertical() {
    _vertical = -_vertical;
  }

  void changeHorizontal() {
    _horizontal = -_horizontal;
  }

  void translate(double x, double y) {
    _rect = _rect.translate(x * _horizontal, y * _vertical);
    _tappeable = _tappeable.translate(x * _horizontal, y * _vertical);
  }
}
