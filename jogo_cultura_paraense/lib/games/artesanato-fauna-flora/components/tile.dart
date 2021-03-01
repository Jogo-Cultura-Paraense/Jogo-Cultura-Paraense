import 'dart:ui';

import 'package:jogo_cultura_paraense/games/artesanato-fauna-flora/find_game.dart';

class Tile {
  final FindGame game;
  final bool target;
  Rect tileRect;
  Paint tilePaint;
  bool touched = false;

  Tile(this.game, double x, double y, this.target) {
    tileRect = Rect.fromLTWH(x, y, game.tileSize, game.tileSize);
    tilePaint = Paint();
    tilePaint.color = target ? Color(0xff6ab04c) : Color(0xffff4757);
  }

  void render(Canvas c) {
    c.drawRect(tileRect, tilePaint);
  }

  void update(double t) {}

  void onTapDown() {
    touched = true;
  }
}
