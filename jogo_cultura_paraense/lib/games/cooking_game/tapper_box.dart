import 'package:flame/game/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:jogo_cultura_paraense/games/cooking_game/ingredient_sprite.dart';

class TapperBox extends Game with TapDetector {
  final VoidCallback _onRightTap;
  final VoidCallback _onWrongTap;
  final double top;
  final double left;
  final double height;
  final double width;
  final Rect _rect;
  final Rect _visibleArea;
  final List<IngredientSprite> _ingredients;
  final double spriteSize;

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
        _visibleArea = Rect.fromLTWH(0, 0, width, height),
        spriteSize = width / 10,
        _ingredients = <IngredientSprite>[
          IngredientSprite(
            x: width / 8,
            y: height / 2 - top,
            size: width / 10,
          ),
          IngredientSprite(
            x: width / 2,
            y: height / 2 - top,
            size: width / 10,
          ),
          IngredientSprite(
            x: 7 * width / 8,
            y: height / 2 - top,
            size: width / 10,
          ),
        ];

  @override
  Color backgroundColor() => Color.fromARGB(0, 0, 0, 0); // Transparent

  @override
  void onTapDown(TapDownDetails d) {
    bool tappedTile = false;
    for (IngredientSprite ingredient in _ingredients) {
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

    for (IngredientSprite ingredient in _ingredients) {
      ingredient.render(canvas);
    }
  }

  @override
  void update(double t) {
    moveSprites();
  }

  void moveSprites() {
    for (IngredientSprite ingredient in _ingredients) {
      if (1 + ingredient.left < _visibleArea.left ||
          1 + ingredient.right > _visibleArea.right) {
        ingredient.changeHorizontal();
      }
      if (1 + ingredient.top < _visibleArea.top ||
          1 + ingredient.bottom > _visibleArea.bottom) {
        ingredient.changeVertical();
      }
      ingredient.translate(4, 1);
    }
  }
}
