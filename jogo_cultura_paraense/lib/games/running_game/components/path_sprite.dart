import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/games/running_game/components/obstacle_sprite.dart';
import 'package:jogo_cultura_paraense/games/running_game/components/running_sprite.dart';

class PathSprite extends SpriteComponent {
  final Color color;
  final List<RunningSprite> onPath = [];

  PathSprite({
    @required double width,
    @required double height,
    @required String imagePath,
    @required double x,
    @required double y,
  }) : this.color = Color(int.parse(imagePath)) {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.sprite = Sprite('findGame/00.png');
  }

  int obstaclesOnPath() {
    int obstacles = 0;
    onPath.forEach((sprite) {
      if (sprite is ObstacleSprite) {
        obstacles += 1;
      }
    });
    return obstacles;
  }

  bool contains(Offset d) => this.toRect().contains(d);

  void addToPath(RunningSprite sprite) {
    sprite.moveTo(this.x + this.width, this.y);
    onPath.add(sprite);
  }

  void removeFromPath(RunningSprite spriteToRemove) {
    this.onPath.removeWhere((sprite) => sprite.id == spriteToRemove.id);
  }

  void moveTo(double x, double y) {
    this.x = x;
    this.y = y;
  }

  @override
  void update(double dt) {
    onPath.forEach((sprite) {
      sprite.update(dt);
    });
    super.update(dt);
  }

  @override
  void render(Canvas canvas) {
    final paint = Paint();
    paint.color = this.color;
    canvas.drawRect(this.toRect(), paint);

    onPath.forEach((sprite) {
      if (sprite.x + sprite.width < 0) {
        sprite.moveTo(this.x + this.width, this.y);
      }
      sprite.render(canvas);
    });
  }
}