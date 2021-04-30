import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';

class MusicaGameTutorial {
  final Rect _tutorialRect;
  //final Sprite _tutorialSprite;
  final Rect _startRect;
  final Sprite _startSprite;
  final VoidCallback onStartTap;

  MusicaGameTutorial({
    @required double screenHeight,
    @required double tileSize,
    @required this.onStartTap,
  })  : _tutorialRect = Rect.fromLTWH(
          tileSize,
          (screenHeight / 2) - (tileSize * 3),
          tileSize * 3,
          tileSize * 7,
        ),
        //_tutorialSprite = Sprite('findGame/how_to.png'),
        _startRect = Rect.fromLTWH(
          tileSize / 2,
          (screenHeight * .75) - (tileSize),
          tileSize * 3,
          tileSize,
        ),
        _startSprite = Sprite('findGame/start_button.png');

  void render(Canvas canvas) {
    //_tutorialSprite.renderRect(canvas, _tutorialRect);
    _startSprite.renderRect(canvas, _startRect);
  }

  bool containsTapDown(TapDownDetails d) {
    return _startRect.contains(d.globalPosition);
  }
}
