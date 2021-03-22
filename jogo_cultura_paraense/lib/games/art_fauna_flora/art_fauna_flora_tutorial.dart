import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';

class ArtFaunaFloraTutorial {
  final Rect _tutorialRect;
  final Sprite _tutorialSprite;
  final Rect _startRect;
  final Sprite _startSprite;
  final VoidCallback onStartTap;

  ArtFaunaFloraTutorial({
    @required double screenHeight,
    @required double tileSize,
    @required this.onStartTap,
  })  : _tutorialRect = Rect.fromLTWH(
          tileSize,
          (screenHeight / 2) - (tileSize * 7),
          tileSize * 7,
          tileSize * 11,
        ),
        _tutorialSprite = Sprite('findGame/how_to.png'),
        _startRect = Rect.fromLTWH(
          tileSize * 1.5,
          (screenHeight * .75) - (tileSize),
          tileSize * 6,
          tileSize * 2,
        ),
        _startSprite = Sprite('findGame/start_button.png');

  void render(Canvas canvas) {
    _tutorialSprite.renderRect(canvas, _tutorialRect);
    _startSprite.renderRect(canvas, _startRect);
  }

  bool containsTapDown(TapDownDetails d) {
    return _startRect.contains(d.globalPosition);
  }
}
