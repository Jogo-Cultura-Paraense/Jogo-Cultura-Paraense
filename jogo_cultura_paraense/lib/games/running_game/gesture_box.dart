import 'dart:math';
import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:jogo_cultura_paraense/games/running_game/components/legend_sprite.dart';
import 'package:jogo_cultura_paraense/games/running_game/components/obstacle_sprite.dart';
import 'package:jogo_cultura_paraense/games/running_game/components/path_sprite.dart';
import 'package:jogo_cultura_paraense/games/running_game/components/running_sprite.dart';
import 'package:jogo_cultura_paraense/games/running_game/LifeBox.dart';
import 'package:jogo_cultura_paraense/games/running_game/models/legend.dart';
import 'package:jogo_cultura_paraense/games/running_game/models/obstacle.dart';

typedef LegendIdCallBack = Function(String legendId);

class GestureBox extends BaseGame with VerticalDragDetector {
  final List<PathSprite> paths;
  final double height;
  final double width;
  final Random random = Random();
  final int speed;
  int currentPathIndex = 0;
  LifeBox temp = LifeBox();
  final List<Legend> legendPool;
  final List<Obstacle> obstaclePool = ObstacleFactory.all;

  GestureBox(
    this.height,
    this.width, {
    @required this.speed,
    @required this.legendPool,
    @required LegendIdCallBack onLegendCollision,
    @required VoidCallback onObstacleCollision,
  }) : paths = <PathSprite>[
          PathSprite(
            width: width,
            height: height / 7,
            imagePath: '0xFF008000',
            x: 0,
            y: height - height / 7,
            onLegendCollision: onLegendCollision,
            onObstacleCollision: onObstacleCollision,
          ),
          PathSprite(
            width: width,
            height: height / 7,
            imagePath: '0xFF800000',
            x: 0,
            y: height - 2 * height / 7,
            onLegendCollision: onLegendCollision,
            onObstacleCollision: onObstacleCollision,
          ),
          PathSprite(
            width: width,
            height: height / 7,
            imagePath: '0xFF590000',
            x: 0,
            y: height - 3 * height / 7,
            onLegendCollision: onLegendCollision,
            onObstacleCollision: onObstacleCollision,
          ),
        ] {
    initPaths();
    initObstacles();
    initPlayer();
  }

  PathSprite get currentPath => paths[currentPathIndex];

  void initPlayer() {
    this.currentPath.addPlayer();
  }

  void initPaths() {
    this.paths.forEach((path) {
      this.add(path);
    });
  }

  void initObstacles() {
    final randomPathIndex = this.random.nextInt(paths.length);
    paths[randomPathIndex].addToPath(randomObstacle());
  }

  ObstacleSprite randomObstacle() {
    final randomObstacleIndex = this.random.nextInt(this.obstaclePool.length);
    final randomObstacle = this.obstaclePool[randomObstacleIndex];
    return ObstacleSprite(
      width: height / 7,
      height: height / 7,
      imagePath: randomObstacle.imagePath,
      modelId: randomObstacle.id,
      speed: speed,
    );
  }

  LegendSprite randomLegend() {
    final randomLegendIndex = this.random.nextInt(this.legendPool.length);
    final randomLegend = this.legendPool[randomLegendIndex];
    return LegendSprite(
      width: height / 7,
      height: height / 7,
      imagePath: randomLegend.imagePath,
      modelId: randomLegend.id,
      speed: speed,
    );
  }

  @override
  void render(Canvas canvas) {
    this.components.forEach((element) {
      element.render(canvas);
    });
  }

  @override
  void update(double t) {
    super.update(t);
    PathSprite currentPath, nextPath;
    RunningSprite lastSprite;
    // Check if the last sprite on each path has passed middle of screen
    for (int i = 0; i < paths.length; i += 1) {
      currentPath = paths[i];
      if (currentPath.onPath.isNotEmpty) {
        lastSprite = currentPath.onPath.last;
        if (lastSprite.x + lastSprite.width < 2 * currentPath.width / 3) {
          // If it has, check if current path has more or equal sprites than next path
          // and if next path has less then 3 sprites on path
          nextPath = paths[(i + 1) % paths.length];
          if (currentPath.onPath.length > nextPath.onPath.length &&
              nextPath.onPath.length < 5) {
            if (this.random.nextBool()) {
              nextPath.addToPath(randomObstacle());
            } else {
              nextPath.addToPath(randomLegend());
            }
          }
        }
      }
    }
  }

  @override
  Color backgroundColor() => Color.fromARGB(0, 0, 0, 0);

  @override
  void onVerticalDragEnd(DragEndDetails details) {
    int nextPathIndex = currentPathIndex;
    if (details.primaryVelocity > 0) {
      if (currentPathIndex > 0) {
        nextPathIndex -= 1;
      }
    } else {
      if (currentPathIndex < paths.length - 1) {
        nextPathIndex += 1;
      }
    }

    if (nextPathIndex != currentPathIndex) {
      this.currentPath.removePlayer();
      currentPathIndex = nextPathIndex;
      this.currentPath.addPlayer();
    }
    super.onVerticalDragEnd(details);
  }
}
