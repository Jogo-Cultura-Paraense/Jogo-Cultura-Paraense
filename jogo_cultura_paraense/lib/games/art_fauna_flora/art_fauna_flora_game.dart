import 'dart:math';
import 'dart:ui';
import 'package:flame/flame.dart';
import 'package:flame/gestures.dart';
import 'package:flame/game.dart';
import 'package:flutter/widgets.dart';
import 'package:jogo_cultura_paraense/games/art_fauna_flora/art_fauna_flora_tutorial.dart';
import 'package:jogo_cultura_paraense/games/art_fauna_flora/components/background.dart';
import 'package:jogo_cultura_paraense/games/art_fauna_flora/components/hint_button.dart';
import 'package:jogo_cultura_paraense/games/art_fauna_flora/components/score_display.dart';
import 'package:jogo_cultura_paraense/games/art_fauna_flora/components/tile.dart';
import 'package:jogo_cultura_paraense/games/art_fauna_flora/components/timer.dart';
import 'package:jogo_cultura_paraense/model/game.dart';
import 'package:jogo_cultura_paraense/pages/score_page.dart';

class ArtFaunaFloraGame extends Game with TapDetector {
  final BuildContext _context;
  final int _topScore;
  final String _gameMap;

  final int _numTargets;
  final double _startTime;
  final double _timeCorrectTile;
  final double _timeIncorrectTile;
  final int pointsCorrectTile;

  final int _spritesRange;
  final List<Tile> _tiles = <Tile>[];
  final List<Tile> _targets = <Tile>[];

  Rect _hudRect;
  Paint _hudPaint;
  Timer _timer;
  ScoreDisplay _scoreDisplay;
  Background _background;
  ArtFaunaFloraTutorial _tutorial;
  HintButton _hintButton;

  Size _screenSize;
  double _tileSize;
  bool _showTutorial = true;

  ArtFaunaFloraGame({
    @required BuildContext context,
    @required int topScore,
    @required String gameMap,
    @required int numTargets,
    @required double startTime,
    @required double timeCorrectTile,
    @required double timeIncorrectTile,
    @required int spritesRange,
    int pointsCorrectTile = 100,
  })  : _context = context,
        _topScore = topScore,
        _gameMap = gameMap,
        _numTargets = numTargets,
        _startTime = startTime,
        _timeCorrectTile = timeCorrectTile,
        _timeIncorrectTile = timeIncorrectTile,
        pointsCorrectTile = pointsCorrectTile,
        _spritesRange = spritesRange {
    _initialize();
  }

  void _initialize() async {
    resize(await Flame.util.initialDimensions());

    _background = Background(
      imagePath:
          _numTargets == 4 ? 'findGame/mangalG.jpeg' : 'findGame/bosqueRA.jpg',
      screenHeight: _screenSize.height,
      screenWidth: _screenSize.width,
    );

    _hudPaint = Paint();
    _hudPaint.color = Color(0x77000000);
    _hudRect = Rect.fromLTWH(
      0,
      _screenSize.height - _tileSize * 2,
      _screenSize.width,
      _tileSize * 2,
    );
    _timer = Timer(
      _startTime,
      screenHeight: _screenSize.height,
      tileSize: _tileSize,
    );
    _scoreDisplay = ScoreDisplay(
      screenWidth: _screenSize.width,
      tileSize: _tileSize,
    );

    _tutorial = ArtFaunaFloraTutorial(
      screenHeight: _screenSize.height,
      tileSize: _tileSize,
      onStartTap: () {
        toogleTutorial();
      },
    );

    _hintButton = HintButton(
      screenWidth: _screenSize.width,
      screenHeight: _screenSize.height,
      tileSize: _tileSize,
      hints: _numTargets == 4 ? 1 : 2,
      onTapDown: () {
        useHint();
      },
    );

    final rnd = Random();
    double x, y;
    var spritesList = List<int>.generate(_spritesRange, (index) => index);
    spritesList.shuffle();
    for (int i = spritesList.length - 1; i >= 0; i--) {
      x = rnd.nextDouble() * (_screenSize.width - _tileSize);
      y = rnd.nextDouble() * (_screenSize.height - _tileSize * 3);
      _tiles.add(Tile(
        x,
        y,
        imageName: spritesList[i],
        tileSize: _tileSize,
        onTapDown: i <= _numTargets
            ? () {
                tapCorretTile(spritesList[i]);
              }
            : () {
                tapIncorrentTile(spritesList[i]);
              },
      ));
      if (i < _numTargets) {
        _targets.add(Tile(
          _tileSize * (i + 1) * 1.1 + 36,
          _screenSize.height - _tileSize * 1.5,
          imageName: spritesList[i],
          tileSize: _tileSize,
        ));
      }
    }
  }

  void tapCorretTile(int tileId) {
    _scoreDisplay.updateScore(pointsCorrectTile);
    _timer.updateTime(_timeCorrectTile);
    removeTarget(tileId);
    removeTile(tileId);
  }

  void tapIncorrentTile(int tileId) {
    _timer.updateTime(_timeIncorrectTile);
    removeTile(tileId);
  }

  void useHint() {
    _scoreDisplay.updateScore(-50);
    removeTile(_targets.last.id);
    removeTarget(_targets.last.id);
  }

  void removeTile(int tileId) {
    _tiles.removeWhere((tile) => tile.id == tileId);
  }

  void removeTarget(int targetId) {
    _targets.removeWhere((tile) => tile.id == targetId);
  }

  bool isVictorious() {
    return _targets.isEmpty;
  }

  void toogleTutorial() {
    _showTutorial = !_showTutorial;
  }

  bool isGameFinished() {
    if (_timer.currentTime <= 0 || _targets.isEmpty) {
      return true;
    }
    return false;
  }

  void onGameFinished() {
    Navigator.of(_context).popAndPushNamed(
      ScorePage.routeName,
      arguments: ScorePageArgs(
        game: Games.faunaAndFlora,
        map: _gameMap,
        score: _scoreDisplay.score,
        finalScore: _scoreDisplay.score,
        topScore: _topScore,
        time: _timer.currentTime,
        prettyTime: _timer.format(_timer.currentTime),
        hintsLeft: (_numTargets == 4 ? 1 : 2) - _hintButton.hintsLeft,
        hints: (_numTargets == 4 ? 1 : 2),
      ),
    );
  }

  @override
  void onTapDown(TapDownDetails d) {
    if (_showTutorial) {
      if (_tutorial.containsTapDown(d)) {
        _tutorial.onStartTap();
      }
    } else {
      if (_hintButton.containsTapDown(d)) {
        _hintButton.onTapDown();
      } else {
        int i = 0;
        while (i < _tiles.length && _tiles[i].containsTapDown(d) == false) {
          i += 1;
        }
        if (i < _tiles.length) {
          _tiles[i].onTapDown();
        }
      }
    }
  }

  @override
  void resize(Size size) {
    _screenSize = size;
    _tileSize = _screenSize.width / 9;
  }

  @override
  void render(Canvas canvas) {
    final bgRect = Rect.fromLTWH(0, 0, _screenSize.width, _screenSize.height);
    final bgPaint = Paint();
    bgPaint.color = Color(0xff576574);
    canvas.drawRect(bgRect, bgPaint);

    _background.render(canvas);
    if (_showTutorial) {
      _tutorial.render(canvas);
    } else {
      canvas.drawRect(_hudRect, _hudPaint);
      _tiles.forEach((Tile tile) => tile.render(canvas));
      _targets.forEach((Tile target) => target.render(canvas));
      _timer.render(canvas);
      _scoreDisplay.render(canvas);
      _hintButton.render(canvas);
    }
  }

  @override
  void update(double t) {
    if (_showTutorial == false) {
      _timer.update(t);
      if (isGameFinished()) {
        onGameFinished();
      }
    }
  }
}
