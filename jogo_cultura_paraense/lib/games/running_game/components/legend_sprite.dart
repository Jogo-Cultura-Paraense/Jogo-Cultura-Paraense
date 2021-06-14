import 'package:flame/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/games/running_game/components/running_sprite.dart';

class LegendSprite extends RunningSprite {
  final FlameAudio audio = FlameAudio();

  LegendSprite({
    @required double width,
    @required double height,
    @required String imagePath,
    @required String modelId,
    @required int speed,
    double x = 0,
    double y = 0,
  }) : super(imagePath, modelId, speed) {
    this.x = x + width;
    this.y = y;
    this.width = width;
    this.height = height;
  }

  @override
  void handleCollision() {
    audio.play("completetask_0.mp3");
    super.handleCollision();
  }
}
