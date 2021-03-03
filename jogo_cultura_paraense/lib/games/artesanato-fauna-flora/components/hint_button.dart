import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:jogo_cultura_paraense/games/artesanato-fauna-flora/components/tile.dart';

import '../find_game.dart';

class HintButton {
  final FindGame game;
  Rect rect;
  // Sprite sprite;
  Paint paint;
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
    //sprite = Sprite('ui/icon-help.png');
    paint = Paint();
    paint.color = Color(0xffffffff);
  }

  void render(Canvas c) {
    // sprite.renderRect(c, rect);
    c.drawRect(rect, paint);
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