part of 'cooking_game_bloc.dart';

enum CookingGameStatus { ready, running, finished }

@immutable
class CookingGameState {
  final CookingGameStatus status;
  final List<Order> orders;
  final int timeLimit;

  CookingGameState({this.status, this.orders, this.timeLimit});

  factory CookingGameState.initial({
    @required List<Order> orders,
    @required int timeLimit,
  }) {
    return CookingGameState(
      status: CookingGameStatus.ready,
      orders: orders,
      timeLimit: timeLimit,
    );
  }

  CookingGameState copyWith({
    CookingGameStatus status,
    List<Order> orders,
    int timeLimit,
  }) {
    return CookingGameState(
      status: status ?? this.status,
      orders: orders ?? this.orders,
      timeLimit: timeLimit ?? this.timeLimit,
    );
  }
}
