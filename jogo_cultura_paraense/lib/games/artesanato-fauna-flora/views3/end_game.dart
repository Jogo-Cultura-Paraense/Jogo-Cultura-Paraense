import 'dart:ui';
import 'package:flame/sprite.dart';
import '../find_game3.dart';

class EndGameView {
  final FindGame3 game;
  Rect rect;
  Sprite sprite;

  EndGameView(this.game) {
    rect = Rect.fromLTWH(
      game.tileSize,
      (game.screenSize.height / 2) - (game.tileSize * 5),
      game.tileSize * 7,
      game.tileSize * 5,
    );
    sprite = Sprite('findGame/end_game.png');
  }

  void render(Canvas c) {
    sprite.renderRect(c, rect);
  }

  void update(double t) {}
}
