import 'dart:ui';
import 'package:jogo_cultura_paraense/games/artesanato-fauna-flora/find_game.dart';

class Hud {
  final FindGame game;
  Rect hudRect;
  Paint hudPaint;

  Hud(this.game) {
    hudRect = Rect.fromLTWH(0, 0, game.screenSize.width, game.tileSize);
    hudPaint = Paint();
    hudPaint.color = Color(0x77000000);
  }

  void render(Canvas c) {
    c.drawRect(hudRect, hudPaint);
  }

  void update(double t) {}
}
