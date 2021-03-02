import 'dart:ui';

import 'package:jogo_cultura_paraense/games/artesanato-fauna-flora/find_game.dart';

class HowToView {
  final FindGame game;
  Rect howToRect;
  Paint howToPaint;
  //Sprite titleSprite;

  HowToView(this.game) {
    howToRect = Rect.fromLTWH(
      game.tileSize,
      (game.screenSize.height / 2) - (game.tileSize * 7),
      game.tileSize * 7,
      game.tileSize * 11,
    );
    howToPaint = Paint();
    howToPaint.color = Color(0xff00ffff);
  }

  void render(Canvas c) {
    c.drawRect(howToRect, howToPaint);
  }

  void update(double t) {}
}
