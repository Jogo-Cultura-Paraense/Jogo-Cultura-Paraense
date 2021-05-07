import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/games/running_game/components/running_sprite.dart';

class PlayerSprite extends RunningSprite {
  PlayerSprite({
    @required double width,
    @required double height,
    @required String imagePath,
    double x = 0,
    double y = 0,
  }) : super(imagePath) {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.sprite = Sprite('findGame/00.png');
  }

  void moveTo(double x, double y) {
    this.x = x;
    this.y = y;
  }

  @override
  void render(Canvas canvas) {
    final paint = Paint();
    paint.color = color;
    canvas.drawRect(this.toRect(), paint);
  }
}
