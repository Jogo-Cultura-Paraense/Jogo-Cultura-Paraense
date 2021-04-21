part of 'cooking_game_bloc.dart';

enum CookingGameStatus { ready, running, finished }

@immutable
class CookingGameState {
  final CookingGameStatus status;
  final List<Order> orders;
  final CookingGameRules rules;

  CookingGameState({
    @required this.status,
    @required this.orders,
    @required this.rules,
  });

  factory CookingGameState.initFromRules({CookingGameRules rules}) {
    return CookingGameState(
      status: CookingGameStatus.ready,
      orders: rules.allOrders,
      rules: rules,
    );
  }

  CookingGameState copyWith({
    CookingGameStatus status,
    List<Order> orders,
  }) {
    return CookingGameState(
      status: status ?? this.status,
      orders: orders ?? this.orders,
      rules: this.rules,
    );
  }
}
