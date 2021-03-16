import 'dart:ui';
import 'package:flame/sprite.dart';
import '../find_game5.dart';

class HintButton {
  final FindGame5 game;
  Rect rect;
  Sprite noSprite;
  Sprite hintSprite;
  // Paint paint;
  int hintsLeft;

  HintButton(this.game) {
    rect = Rect.fromLTWH(
      game.screenSize.width - (game.tileSize * 1.25),
      // game.screenSize.height - (game.tileSize * 1.25),
      game.screenSize.height - game.tileSize * 1.5,
      game.tileSize,
      game.tileSize,
    );
    hintsLeft = 1 * game.gameLevel;
    noSprite = Sprite(
      'findGame/no_button.png',
    );
    hintSprite = Sprite(
      'findGame/hint_button.png',
    );
    // paint = Paint();
    // paint.color = Color(0xffffffff);
  }

  void render(Canvas c) {
    if (hintsLeft > 0) {
      hintSprite.renderRect(c, rect);
    } else {
      noSprite.renderRect(c, rect);
    }
    // c.drawRect(rect, paint);
  }

  void onTapDown() {
    // game.activeView = View.help;
    if (hintsLeft > 0) {
      // Tile element = game.targetTiles.first;
      hintsLeft--;
      game.score -= 50;
      print("hints: $hintsLeft");
    }
  }
}
