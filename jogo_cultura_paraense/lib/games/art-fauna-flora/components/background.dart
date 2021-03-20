import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';

class Background {
  final Sprite _bgSprite;
  final Rect _bgRect;

  Background(
      {@required String imagePath,
      @required double screenHeight,
      @required double screenWidth})
      : _bgSprite = Sprite(imagePath),
        _bgRect = Rect.fromLTWH(
          0,
          0,
          screenWidth,
          screenHeight,
        );

  void render(Canvas canvas) {
    _bgSprite.renderRect(canvas, _bgRect);
  }
}
