import 'dart:ui';
import 'package:flame/sprite.dart';

import '../find_game3.dart';

class Background {
  final FindGame3 game;
  Sprite bgSprite;
  Rect bgRect;

  Background(this.game) {
    bgSprite = Sprite('findGame/background.jpg');
    bgRect = Rect.fromLTWH(
      0,
      game.screenSize.height - (game.tileSize * 12),
      game.tileSize * 9,
      game.tileSize * 12,
    );
  }

  void render(Canvas c) {
    bgSprite.renderRect(c, bgRect);
  }

  void update(double t) {}
}
