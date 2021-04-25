import 'dart:math';

import 'package:flame/game/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/games/cooking_game/ingredient_sprite.dart';
import 'package:jogo_cultura_paraense/games/cooking_game/models/order.dart';

typedef IngredientIdCallBack = Function(String ingredientId);

class TapperBox extends Game with TapDetector {
  final double top;
  final double left;
  final double height;
  final double width;
  final Rect _tappableArea;
  final Rect _visibleArea;
  final Rect _hintRect;
  final double spriteSize;
  final List<List<IngredientSprite>> _ingredientsByOrder = [];
  final List<IngredientSprite> _ingredientsToRender = [];
  final IngredientIdCallBack _signalCorrectTap;
  final VoidCallback _signalHintTap;
  final int hints;
  int _hintsUsed = 0;

  TapperBox({
    @required this.height,
    @required this.width,
    @required List<Order> orders,
    @required IngredientIdCallBack onCorrectTap,
    @required VoidCallback onHintTap,
    @required this.hints,
    this.left = 0,
    this.top = 0,
  })  : _signalCorrectTap = onCorrectTap,
        _signalHintTap = onHintTap,
        _tappableArea = Rect.fromLTWH(width / 4, 0, width / 2, height),
        _visibleArea = Rect.fromLTWH(0, 0, width, height),
        _hintRect = Rect.fromLTWH(0, 0, width / 10, width / 10),
        spriteSize = width / 10 {
    _initIngredients(orders);
  }

  void _initIngredients(List<Order> orders) {
    List<IngredientSprite> ingredients;
    int id = 0;
    // Create a list of ingredients sprite separated by order
    // A unique id is given to each sprite
    for (Order order in orders) {
      ingredients = <IngredientSprite>[];
      for (OrderIngredient ingredient in order.ingredients) {
        for (int i = 0; i < ingredient.quantity; i++) {
          ingredients.add(
            IngredientSprite(
              id: id,
              ingredientId: ingredient.id,
              sprite: ingredient.imagePath,
              x: width / 2,
              y: height / 2,
              size: spriteSize,
            ),
          );
          id += 1;
        }
      }
      _ingredientsByOrder.add(ingredients);
    }
    // Add the ingredients from the first two orders to be rendered
    _ingredientsToRender.addAll(_ingredientsByOrder[0]);
    _ingredientsToRender.addAll(_ingredientsByOrder[1]);
  }

  void handleHintTap() {
    if (_hintsUsed < hints) {
      // Remove the next 5 ingredients in sequence
      for (int i = 0; i < 5; i++) {
        final orderToRemoveFrom = _ingredientsByOrder[0];
        final ingredientToRemove = orderToRemoveFrom[0];
        orderToRemoveFrom.removeAt(0);
        _ingredientsToRender
            .removeWhere((element) => element.id == ingredientToRemove.id);
        if (orderToRemoveFrom.isEmpty) {
          _ingredientsByOrder.removeAt(0);
          // If there are more orders to finish, add to the render
          if (_ingredientsByOrder.length > 1) {
            _ingredientsToRender.addAll(_ingredientsByOrder[1]);
          }
          // Else stop remove loop
          else {
            break;
          }
        }
        _hintsUsed += 1;
      }
      _signalHintTap();
    }
  }

  void handleCorrectTap(IngredientSprite tappedIngredient) {
    // First list of ingredients represent the current order to be cooked
    final orderToRemoveFrom = _ingredientsByOrder[0];
    for (int i = 0; i < orderToRemoveFrom.length; i += 1) {
      // If tapped ingredient is on the list of ingredients of current order:
      // 1. Remove it from current order
      // 2. Remove it from ingredients to render
      // 3. Signal state manager to remove it from state
      if (orderToRemoveFrom[i].ingredientId == tappedIngredient.ingredientId) {
        orderToRemoveFrom.removeAt(i);
        _ingredientsToRender.removeWhere(
          (element) => element.id == tappedIngredient.id,
        );
        _signalCorrectTap(tappedIngredient.ingredientId);
        break;
      }
    }
    // If current order is empty, then remove it
    if (orderToRemoveFrom.isEmpty) {
      _ingredientsByOrder.removeAt(0);
      // If there are more orders to finish, add to the render
      if (_ingredientsByOrder.length > 1) {
        _ingredientsToRender.addAll(_ingredientsByOrder[1]);
      }
    }
  }

  @override
  Color backgroundColor() => Color.fromARGB(0, 0, 0, 0); // Transparent

  @override
  void onTapDown(TapDownDetails d) {
    if (_hintRect.contains(d.localPosition)) {
      handleHintTap();
    } else {
      List<IngredientSprite> tappedIngredients = [];
      // Check which ingredients were tapped
      for (IngredientSprite ingredient in _ingredientsToRender) {
        if (ingredient.contains(d.localPosition)) {
          tappedIngredients.add(ingredient);
        }
      }
      // Check if there is tapped ingredients and the tap was inside tappable area
      if (tappedIngredients.isNotEmpty &&
          _tappableArea.contains(d.localPosition)) {
        // Handle correct tap for each tapped ingredient
        for (IngredientSprite ingredient in tappedIngredients) {
          handleCorrectTap(ingredient);
        }
      }
    }
  }

  @override
  void render(Canvas canvas) {
    final paint = Paint();
    paint.color = Color(0xff576574);
    // canvas.drawRect(_tappableArea, paint);

    canvas.drawRect(_hintRect, paint);

    for (IngredientSprite ingredient in _ingredientsToRender) {
      ingredient.render(canvas);
    }
  }

  @override
  void update(double t) {
    moveSprites(t);
  }

  void moveSprites(double t) {
    final rnd = Random();
    bool changedHorizontal;
    bool changedVertical;

    for (IngredientSprite ingredient in _ingredientsToRender) {
      changedVertical = false;
      changedHorizontal = false;

      // If sprite is too far to the left, send it to the right
      if (ingredient.left < _visibleArea.left) {
        ingredient.toTheRight();
        changedHorizontal = true;
      }
      // Else if sprite is too far to the right, send it to the left
      else if (ingredient.right > _visibleArea.right) {
        ingredient.toTheLeft();
        changedHorizontal = true;
      }
      // If sprite is too far to the top, send it to the bottom
      if (ingredient.top < _visibleArea.top) {
        ingredient.toTheBottom();
        changedVertical = true;
      }
      // Else if sprite is too far to the bottom, send it to the top
      else if (ingredient.bottom > _visibleArea.bottom) {
        ingredient.toTheTop();
        changedVertical = true;
      }

      final flipChance = rnd.nextInt(10) + 1;
      // If only vertical direction changed, roll if horizontal change as well
      if (changedVertical == true && changedHorizontal == false) {
        if (flipChance > 7) {
          ingredient.flipHorizontalDirection();
        }
      }
      // Else if only horizontal direction changed, roll if vertical change as well
      else if (changedVertical == false && changedHorizontal == true) {
        if (flipChance > 7) {
          ingredient.flipVerticalDirection();
        }
      }

      ingredient.translate(t: t);
    }
  }
}
