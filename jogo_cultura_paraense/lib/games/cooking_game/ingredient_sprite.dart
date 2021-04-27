import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flame/sprite.dart';

class IngredientSprite {
  static const directions = [1, -1];

  final int id;
  final String ingredientId;
  final Sprite _sprite;
  Rect _rect;
  Rect _tappeable;
  int _verticalDirection;
  double _verticalSpeed;
  int _horizontalDirection;
  double _horizontalSpeed = 150;

  IngredientSprite({
    @required this.id,
    @required this.ingredientId,
    @required double x,
    @required double y,
    @required double size,
    @required String sprite,
  })  : _rect = Rect.fromCenter(
          center: Offset(x, y),
          width: size,
          height: size,
        ),
        _tappeable = Rect.fromCenter(
          center: Offset(x, y),
          width: size + 10,
          height: size + 10,
        ),
        _sprite = Sprite(sprite) {
    final rnd = Random();
    _verticalDirection = IngredientSprite.directions[rnd.nextInt(2)];
    _horizontalDirection = IngredientSprite.directions[rnd.nextInt(2)];
    _verticalSpeed = (rnd.nextInt(130) + 1).toDouble();
  }

  bool contains(Offset d) => _tappeable.contains(d);

  double get left => _rect.left;
  double get right => _rect.right;
  double get bottom => _rect.bottom;
  double get top => _rect.top;

  void render(Canvas canvas) {
    _sprite.renderRect(canvas, _rect);
  }

  void toTheLeft() {
    _horizontalDirection = -1;
  }

  void toTheRight() {
    _horizontalDirection = 1;
  }

  void toTheTop() {
    _verticalDirection = -1;
  }

  void toTheBottom() {
    _verticalDirection = 1;
  }

  void flipVerticalDirection() {
    _verticalDirection = -_verticalDirection;
  }

  void flipHorizontalDirection() {
    _horizontalDirection = -_horizontalDirection;
  }

  void translate({double x, double y, double t = 1}) {
    final dx = (x ?? _horizontalSpeed) * t * _horizontalDirection;
    final dy = (y ?? _verticalSpeed) * t * _verticalDirection;

    _rect = _rect.translate(dx, dy);
    _tappeable = _tappeable.translate(dx, dy);
  }
}
