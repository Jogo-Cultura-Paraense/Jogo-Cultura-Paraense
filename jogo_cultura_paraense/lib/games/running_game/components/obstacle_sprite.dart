import 'package:flame/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/games/running_game/LifeBox.dart';
import 'package:jogo_cultura_paraense/games/running_game/components/running_sprite.dart';

class ObstacleSprite extends RunningSprite {
  final FlameAudio audio = FlameAudio();

  ObstacleSprite({
    @required double width,
    @required double height,
    @required String imagePath,
    double x = 0,
    double y = 0,
  }) : super(imagePath) {
    this.x = x + width;
    this.y = y;
    this.width = width;
    this.height = height;
  }

  @override
  void handleCollision() {
    LifeBoxScreen temp = LifeBoxScreen.instance;
    temp.decreaseLife();

    audio.play("wrong.wav");
    super.handleCollision();
  }
}
