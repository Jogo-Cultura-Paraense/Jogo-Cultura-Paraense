import 'dart:math';

import 'package:flutter/material.dart';

class IngredientSprite {
  static const directions = [1, -1];

  final int id;
  final String ingredientId;
  Paint _paint = Paint();
  Rect _rect;
  Rect _tappeable;
  int _verticalDirection;
  double _verticalSpeed;
  int _horizontalDirection;
  double _horizontalSpeed = 4;

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
    _verticalDirection = IngredientSprite.directions[rnd.nextInt(2)];
    _horizontalDirection = IngredientSprite.directions[rnd.nextInt(2)];
    _verticalSpeed = (rnd.nextInt(3) + 1).toDouble();
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
    _verticalDirection = -_verticalDirection;
  }

  void changeHorizontal() {
    _horizontalDirection = -_horizontalDirection;
  }

  void translate([double x, double y]) {
    final translateX = x ?? _horizontalSpeed * _horizontalDirection;
    final translateY = y ?? _verticalSpeed * _verticalDirection;
    _rect = _rect.translate(translateX, translateY);
    _tappeable = _tappeable.translate(translateX, translateY);
  }
}
