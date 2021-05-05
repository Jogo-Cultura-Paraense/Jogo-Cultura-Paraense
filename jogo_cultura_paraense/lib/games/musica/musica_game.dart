import 'dart:math';
import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:jogo_cultura_paraense/games/musica/components/hit_text.dart';
import 'package:jogo_cultura_paraense/games/musica/components/music_disc.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:jogo_cultura_paraense/games/musica/musica_tutorial.dart';
import 'package:jogo_cultura_paraense/model/game.dart';
import 'package:jogo_cultura_paraense/pages/pages.dart';

import 'components/timer.dart';

class MusicaGame extends Game with TapDetector {
  final BuildContext _context;
  final int _topScore;
  final String _gameMap;

  Size _screenSize;
  double tileSize;
  List<MusicDisc> discs;
  List<HitText> hitTexts;
  Timer timer;
  //ScoreDisplay _scoreDisplay;

  AudioPlayer music;

  Random rnd;
  double _discTimer;
  double _timeBetweenDiscs;
  double gameTimer;
  double _startTime; //a duração da música (em segundos)
  int perfectsHits;
  int goodHits;
  int earlyHits;
  int missHits;
  int score;

  MusicaGameTutorial tutorial;

  bool _showTutorial = true;

  MusicaGame(
      {@required BuildContext context,
      @required int topScore,
      @required String gameMap,
      @required double startTime,
      @required double timeBetweenDiscs})
      : _context = context,
        _startTime = startTime,
        _topScore = topScore,
        _timeBetweenDiscs = timeBetweenDiscs,
        _gameMap = gameMap {
    _initialize();
  }

  void _initialize() async {
    resize(await Flame.util.initialDimensions());
    _discTimer = 0;
    gameTimer = 0;
    score = 0;
    perfectsHits = 0;
    goodHits = 0;
    earlyHits = 0;
    missHits = 0;
    discs = List<MusicDisc>();
    hitTexts = List<HitText>();
    rnd = Random();
    timer = Timer(_startTime, this,
        screenHeight: _screenSize.height, tileSize: tileSize);

    tutorial = MusicaGameTutorial(
      screenHeight: _screenSize.height,
      tileSize: tileSize,
      onStartTap: () {
        toogleTutorial();
      },
    );

    music =
        await Flame.audio.playLongAudio('bgm/lenda_do_guarana.mp3', volume: .5);
    music.pause();
  }

  void playPlayingBGM() async {
    await music.resume();
  }

  void stopPlayingBGM() async {
    await music.stop();
  }

  void spawnDisc() {
    double x = rnd.nextInt(5) * tileSize;
    double y = rnd.nextInt(7) * tileSize;
    discs.add(MusicDisc(this, x, y));
  }

  void drawHitText(String text, Offset center) {
    hitTexts.add(HitText(this, text, center));
  }

  void onGameFinished() {
    stopPlayingBGM();
    Navigator.of(_context).popAndPushNamed(
      ScorePage.routeName,
      arguments: ScorePageArgs(
        game: Games.music,
        map: _gameMap,
        score: score,
        finalScore: score,
        topScore: _topScore,
        time: gameTimer,
        perfectsHits: perfectsHits,
        goodHits: goodHits,
        earlyHits: earlyHits,
        missHits: missHits,
        prettyTime: timer.format(timer.currentTime),
        hintsLeft: 0, //(_numTargets == 4 ? 1 : 2) - _hintButton.hintsLeft,
        hints: 0, //(_numTargets == 4 ? 1 : 2),
      ),
    );
  }

  void toogleTutorial() {
    _showTutorial = !_showTutorial;
    if (!_showTutorial) {
      playPlayingBGM();
    }
  }

  bool isGameFinished() {
    if (gameTimer >= _startTime) {
      return true;
    }
    return false;
  }

  @override
  void render(Canvas canvas) {
    Rect bgRect = Rect.fromLTWH(0, 0, _screenSize.width, _screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xff576574);
    canvas.drawRect(bgRect, bgPaint);
    if (_showTutorial) {
      tutorial.render(canvas);
    } else {
      discs.forEach((MusicDisc disc) => disc.render(canvas));
      hitTexts.forEach((HitText hitText) => hitText.render(canvas));
    }
  }

  @override
  void update(double t) {
    if (_showTutorial == false) {
      if (isGameFinished()) {
        onGameFinished();
      }
      _discTimer += t;
      gameTimer += t;
      if (_discTimer > _timeBetweenDiscs &&
          gameTimer > 3 &&
          gameTimer < _startTime - 5) {
        spawnDisc();
        _discTimer = 0;
      }
      discs.forEach((MusicDisc disc) => disc.update(t));
      discs.forEach((MusicDisc disc) {
        if (disc.isDead) {
          drawHitText(disc.text, disc.discRect.center);
        }
      });
      discs.removeWhere((MusicDisc disc) => disc.isDead);

      hitTexts.forEach((HitText hitText) => hitText.update(t));
      hitTexts.removeWhere((HitText hitText) => hitText.timer > 1);
    }
  }

  @override
  void resize(Size size) {
    _screenSize = size;
    tileSize = _screenSize.width / 4;
  }

  @override
  void onTapDown(TapDownDetails d) {
    if (_showTutorial) {
      if (tutorial.containsTapDown(d)) {
        tutorial.onStartTap();
      }
    } else {
      discs.forEach((MusicDisc disc) {
        if (disc.discRect.contains(d.globalPosition)) {
          disc.onTapDown();
        }
      });
    }
  }
}
