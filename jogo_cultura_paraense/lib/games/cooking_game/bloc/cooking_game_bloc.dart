import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:jogo_cultura_paraense/games/cooking_game/cooking_game_rules.dart';
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
      newOrders[0].removeIngredient(event.ingredientId);
      if (newOrders[0].ingredients.length < 1) {
        newOrders.removeAt(0);
      }
      yield state.copyWith(
        status: newOrders.isEmpty ? CookingGameStatus.finished : state.status,
        orders: newOrders,
      );
    } else if (event is FinishGame) {
      yield state.copyWith(status: CookingGameStatus.finished);
    }
  }
}
