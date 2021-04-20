part of 'cooking_game_bloc.dart';

enum CookingGameStatus { ready, running, finished }

@immutable
class CookingGameState {
  final CookingGameStatus status;
  final List<Order> orders;
  final int time;

  CookingGameState({this.status, this.orders, this.time});

  factory CookingGameState.initial({
    @required List<Order> orders,
    @required int time,
  }) {
    return CookingGameState(
      status: CookingGameStatus.ready,
      orders: orders,
      time: time,
    );
  }

  CookingGameState copyWith({
    CookingGameStatus status,
    List<Order> orders,
    int time,
  }) {
    return CookingGameState(
      status: status ?? this.status,
      orders: orders ?? this.orders,
      time: time ?? this.time,
    );
  }
}
