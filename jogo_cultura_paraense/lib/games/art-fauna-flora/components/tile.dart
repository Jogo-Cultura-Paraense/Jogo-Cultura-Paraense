import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';

class Tile {
  final int id;
  final Rect _rect;
  final Sprite _sprite;
  final VoidCallback onTapDown;

  Tile(
    double x,
    double y, {
    @required double tileSize,
    @required int imageName,
    this.onTapDown,
  })  : id = imageName,
        _rect = Rect.fromLTWH(x, y, tileSize, tileSize),
        _sprite = Sprite('findGame/0$imageName.png');

  void render(Canvas canvas) {
    _sprite.renderRect(canvas, _rect.inflate(7.5));
  }

  bool containsTapDown(TapDownDetails d) {
    return _rect.contains(d.globalPosition);
  }
}
