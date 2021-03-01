import 'dart:ui';
import 'package:flame/flame.dart';
import 'package:flutter/gestures.dart';
import 'package:flame/game.dart';
import 'package:jogo_cultura_paraense/games/artesanato-fauna-flora/components/hud.dart';
import 'components/tile.dart';
import 'dart:math';

class FindGame extends Game {
  static const String routeName = '/findGame';
  Size screenSize;
  double tileSize;
  List<Tile> tiles;
  int score;
  //Hud hud;

  Random rnd;

  FindGame() {
    initialize();
  }

  void initialize() async {
    score = 0;
    tiles = List<Tile>();
    //hud = Hud(this);
    rnd = Random();
    resize(await Flame.util.initialDimensions());

    spawnTile();
  }

  void render(Canvas canvas) {
    //desenha o fundo
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xff576574);
    canvas.drawRect(bgRect, bgPaint);

    //desenha o hud
    //hud.render(canvas);

    //desenha os tiles
    tiles.forEach((Tile tile) => tile.render(canvas));
  }

  void update(double t) {
    tiles.forEach((Tile tile) => tile.update(t));
    tiles.removeWhere((Tile tile) => tile.touched);
  }

// configura a área do jogo para o tamanho da tela
  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
  }

// configura o controle por toque
  void onTapDown(TapDownDetails d) {
    tiles.forEach(
      (Tile tile) {
        if (tile.tileRect.contains(d.globalPosition)) {
          tile.onTapDown();
        }
      },
    );
  }

  void spawnTile() {
    //double offset = tileSize + 10;
    for (int i = 0; i < 10; i++) {
      double x = rnd.nextDouble() * (screenSize.width - tileSize);
      double y = rnd.nextDouble() * (screenSize.height - tileSize);
      tiles.add(Tile(this, x, y, i < 4 ? true : false));
    }
  }

  bool checkVictory() {
    return (score == 4);
  }
}
