import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:jogo_cultura_paraense/games/artesanato-fauna-flora/find_game.dart';
import 'package:flame/flame_audio.dart';

class Tile {
  final FindGame game;
  final bool target;
  final int name;
  Rect tileRect;
  // Paint tilePaint;
  bool touched;
  bool isHinted;

  FlameAudio audio;

  //carega os sprites
  Sprite tileSprite;
  List<Sprite> rotateTileSprite;
  double rotateSpriteIndex = 0;

  Tile(this.game, double x, double y, this.name, this.target) {
    tileRect = Rect.fromLTWH(x, y, game.tileSize, game.tileSize);
    touched = false;
    isHinted = false;
    tileSprite = Sprite('findGame/0$name.png');
    audio = game.audio;
    audio.disableLog();
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
      game.score += 100; //aumenta o score
      game.timer.timer += 2; //aumenta o tempo de jogo
      audio.play('completetask_0.mp3'); //toca o som de 'correto'
      if (game.score > (game.storage.getInt('highscore') ?? 0)) {
        game.storage.setInt('highscore', game.score);
        game.highscoreDisplay.updateHighscore();
      }
    } else {
      game.timer.timer -= 2; //diminui o tempo de jogo
      audio.play('explosion.wav'); //toca o som de 'errado'
    }
  }
}
