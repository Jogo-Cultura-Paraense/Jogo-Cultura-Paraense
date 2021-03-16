import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:jogo_cultura_paraense/games/artesanato-fauna-flora/find_game4.dart';

class HowToView {
  final FindGame4 game;
  Rect howToRect;
  // Paint howToPaint;
  Sprite titleSprite;

  HowToView(this.game) {
    howToRect = Rect.fromLTWH(
      game.tileSize,
      (game.screenSize.height / 2) - (game.tileSize * 7),
      game.tileSize * 7,
      game.tileSize * 11,
    );
    // howToPaint = Paint();
    // howToPaint.color = Color(0xff00ffff);
    titleSprite = Sprite('findGame/how_to.png');
  }

  void render(Canvas c) {
    titleSprite.renderRect(c, howToRect);
  }

  void update(double t) {}
}
