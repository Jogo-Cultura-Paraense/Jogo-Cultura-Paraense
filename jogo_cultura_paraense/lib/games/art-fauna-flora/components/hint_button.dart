import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';

class HintButton {
  final Rect _rect;
  final Sprite _noSprite;
  final Sprite _hintSprite;
  final VoidCallback _onTapDown;
  int hintsLeft;

  HintButton({
    @required double screenWidth,
    @required double screenHeight,
    @required double tileSize,
    @required int hints,
    @required VoidCallback onTapDown,
  })  : _rect = Rect.fromLTWH(
          screenWidth - (tileSize * 1.25),
          screenHeight - tileSize * 1.5,
          tileSize,
          tileSize,
        ),
        hintsLeft = hints,
        _noSprite = Sprite('findGame/no_button.png'),
        _hintSprite = Sprite('findGame/hint_button.png'),
        _onTapDown = onTapDown;

  void render(Canvas canvas) {
    if (hintsLeft > 0) {
      _hintSprite.renderRect(canvas, _rect);
    } else {
      _noSprite.renderRect(canvas, _rect);
    }
  }

  void onTapDown() {
    if (hintsLeft > 0) {
      hintsLeft -= 1;
      _onTapDown();
    }
  }

  bool containsTapDown(TapDownDetails d) {
    return _rect.contains(d.globalPosition);
  }
}
