import 'dart:math';

import 'package:flame/game/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jogo_cultura_paraense/games/cooking_game/bloc/cooking_game_bloc.dart';
import 'package:jogo_cultura_paraense/games/cooking_game/ingredient_sprite.dart';
import 'package:jogo_cultura_paraense/games/models/order.dart';

class TapperBox extends Game with TapDetector {
  final BuildContext _context;
  final double top;
  final double left;
  final double height;
  final double width;
  final Rect _rect;
  final Rect _moveableArea;
  final double spriteSize;
  final List<List<IngredientSprite>> _ingredientsPool = [];
  final List<IngredientSprite> _currentIngredients = [];

  TapperBox({
    @required BuildContext context,
    @required this.height,
    @required this.width,
    @required List<Order> orders,
    this.left = 0,
    this.top = 0,
  })  : _context = context,
        _rect = Rect.fromLTWH(width / 4, 0, width / 2, height),
        _moveableArea = Rect.fromLTWH(
          0,
          0,
          width,
          height,
        ),
        spriteSize = width / 10 {
    _initIngredients(orders);
  }

  void _initIngredients(List<Order> orders) {
    List<IngredientSprite> ingredients;
    final rnd = Random();
    int id = 0;
    for (Order order in orders) {
      ingredients = <IngredientSprite>[];
      for (OrderIngredient ingredient in order.ingredients) {
        for (int i = 0; i < ingredient.quantity; i++) {
          ingredients.add(
            IngredientSprite(
              id: id,
              ingredientId: ingredient.ingredient.id,
              sprite: ingredient.ingredient.imagePath,
              x: width / 2,
              y: height / 2,
              size: width / 10,
            ),
          );
          id += 1;
        }
      }
      _ingredientsPool.add(ingredients);
    }
    _currentIngredients.addAll(_ingredientsPool[0]);
    _currentIngredients.addAll(_ingredientsPool[1]);
  }

  void removeIngredient(IngredientSprite tappedIngredient) {
    final currentOrder = _ingredientsPool[0];
    for (int i = 0; i < _ingredientsPool.length; i += 1) {
      if (currentOrder[i].ingredientId == tappedIngredient.ingredientId) {
        currentOrder.removeAt(i);
        _currentIngredients.removeWhere(
          (element) => element.id == tappedIngredient.id,
        );
        BlocProvider.of<CookingGameBloc>(_context).add(
          RemoveIngredient(tappedIngredient.ingredientId),
        );
        break;
      }
    }
    if (currentOrder.isEmpty) {
      _ingredientsPool.removeAt(0);
      if (_ingredientsPool.length > 1) {
        _currentIngredients.addAll(_ingredientsPool[1]);
      }
    }
  }

  @override
  Color backgroundColor() => Color.fromARGB(0, 0, 0, 0); // Transparent

  @override
  void onTapDown(TapDownDetails d) {
    bool tappedTile = false;
    IngredientSprite tappedIngredient;
    for (IngredientSprite ingredient in _currentIngredients) {
      if (ingredient.contains(d.localPosition)) {
        tappedIngredient = ingredient;
        tappedTile = true;
        break;
      }
    }
    if (tappedTile) {
      if (_rect.contains(d.localPosition)) {
        removeIngredient(tappedIngredient);
      }
    }
  }

  @override
  void render(Canvas canvas) {
    final paint = Paint();
    paint.color = Color(0xff576574);
    canvas.drawRect(_rect, paint);

    for (IngredientSprite ingredient in _currentIngredients) {
      ingredient.render(canvas);
    }
  }

  @override
  void update(double t) {
    moveSprites();
  }

  void moveSprites() {
    final rnd = Random();
    for (IngredientSprite ingredient in _currentIngredients) {
      if (1 + ingredient.left < _moveableArea.left ||
          1 + ingredient.right > _moveableArea.right) {
        ingredient.changeHorizontal();
        if (rnd.nextInt(10) > 7) {
          ingredient.changeVertical();
        }
      }
      if (1 + ingredient.top < _moveableArea.top ||
          1 + ingredient.bottom > _moveableArea.bottom) {
        ingredient.changeVertical();
        if (rnd.nextInt(10) > 7) {
          ingredient.changeHorizontal();
        }
      }
      ingredient.translate();
    }
  }
}
