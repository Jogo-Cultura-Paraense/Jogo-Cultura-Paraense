part of 'cooking_game_bloc.dart';

@immutable
abstract class CookingGameState {
  final List<Order> orders;
  const CookingGameState({this.orders});

  CookingGameInitial gameInitial({List<Order> orders}) {
    return CookingGameInitial(orders ?? this.orders);
  }
}

class CookingGameInitial extends CookingGameState {
  const CookingGameInitial(List<Order> orders) : super(orders: orders);
}
