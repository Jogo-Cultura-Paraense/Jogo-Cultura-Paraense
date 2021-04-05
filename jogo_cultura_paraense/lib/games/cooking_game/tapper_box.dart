import 'package:flame/game/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class TapperBox extends Game with TapDetector {
  final VoidCallback _onRightTap;
  final VoidCallback _onWrongTap;
  final double left;
  final double top;
  final double height;
  final double width;
  final Rect _rect;
  final List<Rect> _ingredients;

  TapperBox({
    @required VoidCallback onRightTap,
    @required VoidCallback onWrongTap,
    @required this.height,
    @required this.width,
    this.left = 0,
    this.top = 0,
  })  : _onRightTap = onRightTap,
        _onWrongTap = onWrongTap,
        _rect = Rect.fromLTWH(width / 4, 0, width / 2, height),
        _ingredients = <Rect>[
          Rect.fromLTWH(7 * width / 60, height / 2, width / 10, width / 10),
          Rect.fromLTWH(47 * width / 60, height / 2, width / 10, width / 10),
          Rect.fromLTWH(9 * width / 20, height / 2, width / 10, width / 10),
        ];

  @override
  Color backgroundColor() => Color.fromARGB(0, 0, 0, 0);

  @override
  void onTapDown(TapDownDetails d) {
    bool tappedTile = false;
    for (Rect ingredient in _ingredients) {
      if (ingredient.contains(d.localPosition)) {
        tappedTile = true;
        break;
      }
    }
    if (tappedTile) {
      if (_rect.contains(d.localPosition)) {
        _onRightTap();
      } else {
        _onWrongTap();
      }
    }
  }

  @override
  void render(Canvas canvas) {
    final paint = Paint();
    paint.color = Color(0xff576574);
    canvas.drawRect(_rect, paint);

    final ingredientPaint = Paint();
    ingredientPaint.color = Color(0xFF42A5F5);
    for (Rect ingredient in _ingredients) {
      canvas.drawRect(ingredient, ingredientPaint);
    }
  }

  @override
  void update(double t) {
    // TODO: implement update
  }
}
