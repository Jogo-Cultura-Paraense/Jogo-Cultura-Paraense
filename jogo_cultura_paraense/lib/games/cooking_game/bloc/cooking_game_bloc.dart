import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:jogo_cultura_paraense/games/cooking_game/models/rules.dart';
import 'package:jogo_cultura_paraense/games/cooking_game/models/order.dart';
import 'package:meta/meta.dart';

part 'cooking_game_event.dart';
part 'cooking_game_state.dart';

class CookingGameBloc extends Bloc<CookingGameEvent, CookingGameState> {
  CookingGameBloc(CookingGameRules rules)
      : super(CookingGameState.initFromRules(rules: rules));

  @override
  Stream<CookingGameState> mapEventToState(CookingGameEvent event) async* {
    if (event is RemoveIngredient) {
      final newOrders = state.orders;
      // Remove a ingredient in first order (it removes quantity first)
      newOrders[0].removeIngredient(event.ingredientId);
      // If there are no more ingredients in order, remove it
      if (newOrders[0].ingredients.length < 1) {
        newOrders.removeAt(0);
      }
      yield state.copyWith(
        status: newOrders.isEmpty ? CookingGameStatus.finished : state.status,
        orders: newOrders,
      );
    } else if (event is RemoveTopIngredients) {
      final newOrders = state.orders;
      for (int i = 0; i < event.top; i++) {
        final ingredientToRemove = newOrders[0].ingredients[0];
        // Remove a ingredient in first order (it removes quantity first)
        newOrders[0].removeIngredient(ingredientToRemove.id);
        // If there are no more ingredients in order, remove it
        if (newOrders[0].ingredients.length < 1) {
          newOrders.removeAt(0);
          // If there are no more orders, stop remove loop
          if (newOrders.isEmpty) {
            break;
          }
        }
      }
      yield state.copyWith(
        status: newOrders.isEmpty ? CookingGameStatus.finished : state.status,
        orders: newOrders,
        hints: state.hints + 1,
      );
    } else if (event is FinishGame) {
      yield state.copyWith(status: CookingGameStatus.finished);
    }
  }
}
