import 'dart:ui';
import 'package:flame/flame.dart';
import 'package:flutter/gestures.dart';
import 'package:flame/game.dart';
import 'package:jogo_cultura_paraense/games/artesanato-fauna-flora/components/hint_button.dart';
import 'package:jogo_cultura_paraense/games/artesanato-fauna-flora/components/start_button.dart';
import 'package:jogo_cultura_paraense/games/artesanato-fauna-flora/components/timer.dart';
import 'package:jogo_cultura_paraense/games/artesanato-fauna-flora/views/end_game.dart';
import 'package:jogo_cultura_paraense/games/artesanato-fauna-flora/views/how_to.dart';
import 'components/hud.dart';
import 'components/tile.dart';
import 'components/views.dart';
import 'dart:math';

class FindGame extends Game {
  View activeView = View.howTo;
  static const String routeName = '/findGame';
  Size screenSize;
  double tileSize;
  List<Tile> tiles;
  List<Tile> targetTiles;
  int score;
  Hud hud;
  int numTargets;

  final int gameLevel = 1;
  //int timer;

// inicializa as views do game
  HowToView howToView;
  StartButton startButton;
  EndGameView endGameView;
  HintButton hintButton;
  Timer timer;

  Random rnd;

  FindGame() {
    initialize();
  }

  void initialize() async {
    score = 0;
    numTargets = 2 + (2 * gameLevel);

    resize(
        await Flame.util.initialDimensions()); //delimita as dimensões da tela
    tiles = List<Tile>();
    targetTiles = List<Tile>();

// carrega os elementos da UI
    hud = Hud(this);
    startButton = StartButton(this);
    hintButton = HintButton(this);

    howToView = HowToView(this);
    endGameView = EndGameView(this);

    rnd = Random();

    timer = Timer(this);

    spawnTile();
  }

  void render(Canvas canvas) {
    //desenha o fundo
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xff576574);
    canvas.drawRect(bgRect, bgPaint);

    if (activeView == View.howTo)
      howToView.render(canvas);
    else if (activeView == View.play) {
      tiles.forEach((Tile tile) => tile.render(canvas));
      //desenha o hud
      hud.render(canvas);
      targetTiles.forEach((Tile target) => target.render(canvas));
      hintButton.render(canvas);
      timer.render(canvas);
    }
    if (activeView == View.endGame) {
      endGameView.render(canvas);
    }

    if (activeView == View.howTo || activeView == View.endGame) {
      startButton.render(canvas);
    }
  }

  void update(double t) {
    if (activeView == View.play) timer.update(t);
    if (timer.timer <= 0) activeView = View.endGame;

    tiles.forEach((Tile tile) => tile.update(t));

    tiles.removeWhere((Tile tile) => tile.touched);

    if (activeView == View.endGame) {
      initialize();
    }
  }

// configura a área do jogo para o tamanho da tela
  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
  }

// configura o controle por toque
  void onTapDown(TapDownDetails d) {
    bool isHandled = false;
    if (!isHandled && startButton.startButtonRect.contains(d.globalPosition)) {
      if (activeView == View.howTo || activeView == View.endGame) {
        startButton.onTapDown();
        isHandled = true;
      }
    }
    if (!isHandled) {
      tiles.forEach(
        (Tile tile) {
          if (tile.tileRect.contains(d.globalPosition)) {
            tile.onTapDown();
            isHandled = true;
            targetTiles.removeWhere((Tile target) => target.name == tile.name);
            if (checkVictory()) {
              activeView = View.endGame;
            }
          }
        },
      );
    }
    // botão de dica
    if (!isHandled && hintButton.rect.contains(d.globalPosition)) {
      if (activeView == View.play) {
        hintButton.onTapDown();
      }
    }
  }

  void spawnTile() {
    for (int i = 10; i > 0; i--) {
      double x = rnd.nextDouble() * (screenSize.width - tileSize);
      double y = rnd.nextDouble() * (screenSize.height - tileSize * 3);

      tiles.add(Tile(this, x, y, i.toString(), i <= numTargets ? true : false));
      if (i <= numTargets) {
        Tile newTile = Tile(this, tileSize * i * 1.1 + 36,
            screenSize.height - tileSize * 1.5, i.toString(), true);
        targetTiles.add(newTile);
      }
    }
  }

  bool checkVictory() {
    //return (score == numTargets);
    return targetTiles.isEmpty;
  }
}
