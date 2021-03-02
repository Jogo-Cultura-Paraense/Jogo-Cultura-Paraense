import 'dart:ui';
import 'package:flame/sprite.dart';
import '../find_game.dart';

class EndGameView {
  final FindGame game;
  Rect rect;
  Paint paint;
  Sprite sprite;

  EndGameView(this.game) {
    rect = Rect.fromLTWH(
      game.tileSize,
      (game.screenSize.height / 2) - (game.tileSize * 5),
      game.tileSize * 7,
      game.tileSize * 5,
    );
    paint = Paint();
    paint.color = Color(0xff004fff);
    //sprite = Sprite('bg/lose-splash.png');
  }

  void render(Canvas c) {
    c.drawRect(rect, paint);
  }

  void update(double t) {}
}
