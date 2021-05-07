import 'dart:math';
import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/gestures.dart';
import 'package:jogo_cultura_paraense/games/running_game/components/obstacle_sprite.dart';
import 'package:jogo_cultura_paraense/games/running_game/components/path_sprite.dart';
import 'package:jogo_cultura_paraense/games/running_game/components/player_sprite.dart';
import 'package:jogo_cultura_paraense/games/running_game/components/running_sprite.dart';

class GestureBox extends BaseGame with VerticalDragDetector {
  final List<PathSprite> paths;
  final PlayerSprite player;
  final double height;
  final double width;
  int currentPathIndex = 0;

  GestureBox(this.height, this.width)
      : paths = <PathSprite>[
          PathSprite(
            width: width,
            height: height / 15,
            imagePath: '0xFFFFFF00',
            x: 0,
            y: height - height / 15,
          ),
          PathSprite(
            width: width,
            height: height / 15,
            imagePath: '0xFF008000',
            x: 0,
            y: height - 2 * height / 15,
          ),
          PathSprite(
            width: width,
            height: height / 15,
            imagePath: '0xFFFF0000',
            x: 0,
            y: height - 3 * height / 15,
          ),
        ],
        player = PlayerSprite(
          width: height / 15,
          height: height / 15,
          imagePath: '0xFF000000',
        ) {
    initPaths();
    initObstacles();
    initPlayer();
  }

  PathSprite get currentPath => paths[currentPathIndex];

  void initPlayer() {
    player.moveTo(
      this.currentPath.x,
      this.currentPath.y,
    );
    this.add(player);
  }

  void initPaths() {
    this.paths.forEach((path) {
      this.add(path);
    });
  }

  void initObstacles() {
    final random = Random();
    // Choose a random path to add a random sprite
    paths[random.nextInt(paths.length)].addToPath(
      ObstacleSprite(
        width: height / 15,
        height: height / 15,
        imagePath: '0xFF0000FF',
      ),
    );
  }

  @override
  void update(double t) {
    super.update(t);
    PathSprite path, nextPath;
    List<RunningSprite> spritesOnPath;
    bool passedMiddle;
    // Check if a sprite on each path has passed middle of screen
    for (int i = 0; i < paths.length; i += 1) {
      passedMiddle = false;
      path = paths[i];
      spritesOnPath = path.onPath;
      for (RunningSprite sprite in spritesOnPath) {
        if (sprite.x + sprite.width < path.width / 2) {
          passedMiddle = true;
          break;
        }
      }
      // If it has, add a random sprite to next path
      if (passedMiddle) {
        nextPath = paths[(i + 1) % paths.length];
        if (nextPath.onPath.length < 3) {
          nextPath.addToPath(
            ObstacleSprite(
              width: height / 15,
              height: height / 15,
              imagePath: '0xFF0000FF',
            ),
          );
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
      currentPathIndex = nextPathIndex;
      player.moveTo(this.currentPath.x, this.currentPath.y);
    }
    super.onVerticalDragEnd(details);
  }
}
