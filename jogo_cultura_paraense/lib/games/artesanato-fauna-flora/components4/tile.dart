import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:jogo_cultura_paraense/games/artesanato-fauna-flora/find_game4.dart';

class Tile {
  final FindGame4 game;
  final bool target;
  final int name;
  Rect tileRect;
  // Paint tilePaint;
  bool touched;
  bool isHinted;

  //carega os sprites
  Sprite tileSprite;
  List<Sprite> rotateTileSprite;
  double rotateSpriteIndex = 0;

  Tile(this.game, double x, double y, this.name, this.target) {
    tileRect = Rect.fromLTWH(x, y, game.tileSize, game.tileSize);
    touched = false;
    isHinted = false;
    tileSprite = Sprite('findGame/$name.png');
  }

  void render(Canvas c) {
    if (isHinted) {
      rotateTileSprite[rotateSpriteIndex.toInt()]
          .renderRect(c, tileRect.inflate(5));
    } else {
      tileSprite.renderRect(c, tileRect.inflate(5));
    }
  }

  void update(double t) {}

  void onTapDown() {
    touched = true;
    print("$name");
    if (target) {
      game.score += 100;
      game.timer.timer += 1;
    } else {
      game.timer.timer -= 1;
    }
  }
}
