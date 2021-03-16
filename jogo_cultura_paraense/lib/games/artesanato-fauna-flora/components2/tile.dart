import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:jogo_cultura_paraense/games/artesanato-fauna-flora/find_game2.dart';

class Tile {
  final FindGame2 game;
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
    tileSprite = Sprite('findGame/0$name.png');
  }

  void render(Canvas c) {
    if (isHinted) {
      rotateTileSprite[rotateSpriteIndex.toInt()]
          .renderRect(c, tileRect.inflate(7.5));
    } else {
      tileSprite.renderRect(c, tileRect.inflate(7.5));
    }
  }

  void update(double t) {}

  void onTapDown() {
    touched = true;
    print("$name");
    if (target) {
      game.score += 100;
      game.timer.timer += 2;
      if (game.score > (game.storage.getInt('highscore') ?? 0)) {
        game.storage.setInt('highscore', game.score);
        game.highscoreDisplay.updateHighscore();
      }
    } else {
      game.timer.timer -= 2;
    }
  }
}
