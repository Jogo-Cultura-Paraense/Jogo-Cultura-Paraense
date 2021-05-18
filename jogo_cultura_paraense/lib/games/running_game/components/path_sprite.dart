import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/games/running_game/components/obstacle_sprite.dart';
import 'package:jogo_cultura_paraense/games/running_game/components/player_sprite.dart';
import 'package:jogo_cultura_paraense/games/running_game/components/running_sprite.dart';

class PathSprite extends SpriteComponent {
  final Color color;
  final List<RunningSprite> onPath = [];
  PlayerSprite player;

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

  void addPlayer() {
    player = PlayerSprite(
      x: 0,
      y: this.y,
      width: height,
      height: height,
      imagePath: '0xFF000000',
    );
  }

  void removePlayer() {
    player = null;
  }

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
    int i = 0;
    RunningSprite sprite;
    while (i < this.onPath.length) {
      sprite = onPath[i];
      if (player != null && sprite.x < player.x + player.width) {
        sprite.handleCollision();
        this.removeFromPath(sprite);
        i -= 1;
      }
      sprite.update(dt);
      i += 1;
    }
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

    if (this.player != null) {
      player.render(canvas);
    }
  }
}
