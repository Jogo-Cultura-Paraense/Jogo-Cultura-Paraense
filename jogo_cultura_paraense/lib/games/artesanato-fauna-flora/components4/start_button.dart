import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:jogo_cultura_paraense/games/artesanato-fauna-flora/components4/views.dart';

import '../find_game4.dart';

class StartButton {
  final FindGame4 game;
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
    sprite = Sprite('findGame/start_button.png');
  }

  void render(Canvas c) {
    sprite.renderRect(c, startButtonRect);
  }

  void update(double t) {}

  void onTapDown() {
    game.activeView = View.play;
    game.score = 0;
  }
}
