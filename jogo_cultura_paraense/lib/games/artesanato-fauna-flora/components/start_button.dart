import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:jogo_cultura_paraense/games/artesanato-fauna-flora/components/views.dart';

import '../find_game.dart';

class StartButton {
  final FindGame game;
  Rect startButtonRect;
  Paint startButtonPaint;
  Sprite sprite;

  StartButton(this.game) {
    startButtonRect = Rect.fromLTWH(
      game.tileSize * 1.5,
      (game.screenSize.height * .75) - (game.tileSize),
      game.tileSize * 6,
      game.tileSize * 2,
    );
    startButtonPaint = Paint();
    startButtonPaint.color = Color(0xff004fff);
  }

  void render(Canvas c) {
    c.drawRect(startButtonRect, startButtonPaint);
    //sprite.renderRect(c, startButtonRect); // caso use sprite
  }

  void update(double t) {}

  void onTapDown() {
    game.activeView = View.play;
  }
}
