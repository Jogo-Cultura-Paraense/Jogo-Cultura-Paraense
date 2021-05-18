import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/games/musica/musica_game.dart';

class MusicDisc {
  final MusicaGame game;
  Rect discRect;
  Rect targetRect;
  Paint discPaint;
  Paint targetPaint;
  bool isDead;
  double timeLeft = 3;
  String text;

  Sprite _sprite;

  MusicDisc(this.game, double x, double y, String spriteName) {
    isDead = false;
    discRect = Rect.fromLTWH(x, y, game.tileSize, game.tileSize);
    targetRect = Rect.fromCenter(
        center: discRect.center,
        width: discRect.width / 2,
        height: discRect.height / 2);
    targetPaint = Paint();
    targetPaint.color = Color(0xffffffff);
    discPaint = Paint();
    discPaint.color = Color(0x88000000);
    _sprite = Sprite('musicGame/icons/$spriteName.png');
    text = "FALHOU";
  }

  void render(Canvas c) {
    c.drawRect(discRect, discPaint);
    c.drawRect(targetRect, targetPaint);
    _sprite.renderRect(c, targetRect.inflate(2));
  }

  void update(double t) {
    discRect = discRect.deflate(10 * t);
    if (discRect.width < game.tileSize / 2) {
      game.missHits++;
      isDead = true;
    }
  }

  void onTapDown() {
    hitText();
    isDead = true;
  }

  void hitText() {
    if (discRect.width <= (game.tileSize / 2) + 5) {
      game.score += 100;
      game.perfectsHits++;
      text = "PERFEITO";
    } else if ((discRect.width > (game.tileSize / 2) + 5) &&
        (discRect.width <= (game.tileSize / 2) + 15)) {
      game.score += 75;
      game.goodHits++;
      text = "BOM";
    } else {
      game.score += 50;
      game.earlyHits++;
      text = "CEDO";
    }
  }
}
