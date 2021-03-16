import 'dart:ui';
import 'package:flame/sprite.dart';

import '../find_game6.dart';

class Background {
  final FindGame6 game;
  Sprite bgSprite;
  Rect bgRect;

  Background(this.game) {
    bgSprite = Sprite('findGame/background.jpg');
    bgRect = Rect.fromLTWH(
      0,
      game.screenSize.height - (game.tileSize * 16),
      game.tileSize * 9,
      game.tileSize * 18,
    );
  }

  void render(Canvas c) {
    bgSprite.renderRect(c, bgRect);
  }

  void update(double t) {}
}
