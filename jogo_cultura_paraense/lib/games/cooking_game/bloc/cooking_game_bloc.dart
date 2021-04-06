import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:jogo_cultura_paraense/games/models/order.dart';
import 'package:meta/meta.dart';

part 'cooking_game_event.dart';
part 'cooking_game_state.dart';

class CookingGameBloc extends Bloc<CookingGameEvent, CookingGameState> {
  CookingGameBloc(List<Order> orders) : super(CookingGameInitial(orders));

  @override
  Stream<CookingGameState> mapEventToState(CookingGameEvent event) async* {
    if (event is RemoveIngredient) {
      if (state.orders.length > 0) {
        final newOrders = state.orders;
        newOrders[0].removeIngredient();
        if (newOrders[0].ingredients.length < 1) {
          newOrders.removeAt(0);
        }
        yield state.gameInitial(orders: newOrders);
      }
      yield state;
    }
  }
}
