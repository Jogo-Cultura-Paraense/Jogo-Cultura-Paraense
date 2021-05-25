import 'package:flame/flame_audio.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/games/running_game/TargetsBox.dart';
import 'package:jogo_cultura_paraense/games/running_game/components/running_sprite.dart';
import 'package:jogo_cultura_paraense/games/running_game/attributes.dart' as globals;

class LegendSprite extends RunningSprite {
  final FlameAudio audio = FlameAudio();

  LegendSprite({
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
    globals.temp3.decreaseTarget();
    audio.play("completetask_0.mp3");
    super.handleCollision();
  }
}
