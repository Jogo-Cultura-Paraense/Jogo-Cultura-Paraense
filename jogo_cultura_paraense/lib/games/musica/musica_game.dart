import 'dart:math';
import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:jogo_cultura_paraense/games/musica/components/hit_text.dart';
import 'package:jogo_cultura_paraense/games/musica/components/music_disc.dart';
import 'package:audioplayers/audioplayers.dart';

class MusicaGame extends Game with TapDetector {
  /* final BuildContext _context;
  final int _topScore;
  final String _gameMap;

  final double _startTime; */
  Size _screenSize;
  double tileSize;
  bool hasWon = false;
  // int numtoques = 0;
  List<MusicDisc> discs;
  List<HitText> hitTexts;

  AudioPlayer playingBGM;

  Random rnd;
  double discTimer;
  double gameTimer;
  double musicDuration;
  int perfectsHits;
  int goodHits;
  int earlyHits;
  int missHits;
  int score;

  MusicaGame() {
    _initialize();
  }

  void _initialize() async {
    discTimer = 0;
    gameTimer = 0;
    musicDuration = 10;
    score = 0;
    perfectsHits = 0;
    goodHits = 0;
    earlyHits = 0;
    missHits = 0;
    discs = List<MusicDisc>();
    hitTexts = List<HitText>();
    rnd = Random();
    resize(await Flame.util.initialDimensions());

    playingBGM =
        await Flame.audio.playLongAudio('bgm/lenda_do_guarana.mp3', volume: .5);
    // playingBGM.pause();

    // playPlayingBGM();
  }

  void playPlayingBGM() {
    playingBGM.resume();
  }

  void spawnDisc() {
    double x = rnd.nextInt(5) * tileSize;
    double y = rnd.nextInt(7) * tileSize;
    discs.add(MusicDisc(this, x, y));
  }

  void drawHitText(String text, Offset center) {
    hitTexts.add(HitText(this, text, center));
  }

  void drawTimer() {}

  @override
  void render(Canvas canvas) {
    Rect bgRect = Rect.fromLTWH(0, 0, _screenSize.width, _screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xff576574);
    canvas.drawRect(bgRect, bgPaint);

    discs.forEach((MusicDisc disc) => disc.render(canvas));
    hitTexts.forEach((HitText hitText) => hitText.render(canvas));
  }

  @override
  void update(double t) {
    discTimer += t;
    gameTimer += t;
    if (discTimer > 0.75 && gameTimer > 3 && gameTimer < musicDuration) {
      spawnDisc();
      discTimer = 0;
    }
    discs.forEach((MusicDisc disc) => disc.update(t));
    discs.removeWhere((MusicDisc disc) => disc.isDead);

    hitTexts.forEach((HitText hitText) => hitText.update(t));
    hitTexts.removeWhere((HitText hitText) => hitText.timer > 1);
  }

  @override
  void resize(Size size) {
    if (gameTimer < 3) {
      drawTimer();
    }
    _screenSize = size;
    tileSize = _screenSize.width / 4;
  }

  @override
  void onTapDown(TapDownDetails d) {
    discs.forEach((MusicDisc disc) {
      if (disc.discRect.contains(d.globalPosition)) {
        disc.onTapDown();
        drawHitText(disc.text, disc.discRect.center);
      }
    });
  }
}
