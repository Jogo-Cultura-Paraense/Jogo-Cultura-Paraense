import 'dart:ui';

import 'package:jogo_cultura_paraense/games/musica/musica_game.dart';

class MusicDisc {
  final MusicaGame game;
  Rect discRect;
  Paint discPaint;
  bool isDead;
  double timeLeft = 3;

  MusicDisc(this.game, double x, double y) {
    isDead = false;
    discRect = Rect.fromLTWH(x, y, game.tileSize, game.tileSize);
    discPaint = Paint();
    discPaint.color = Color(0xff6ab04c);
  }

  void render(Canvas c) {
    c.drawRect(discRect, discPaint);
  }

  void update(double t) {
    discRect = discRect.deflate(10 * t);
    if (discRect.width < game.tileSize / 2) {
      game.missHits++;
      print("missHits: ${game.missHits}");
      isDead = true;
    }
  }

  void onTapDown() {
    //discPaint.color = Color(0xffff4757);
    isDead = true;
    game.score += 100;
    game.perfectsHits += 1;
    print("gameHits: ${game.perfectsHits}");
    //game.spawnDisc();
  }
}
