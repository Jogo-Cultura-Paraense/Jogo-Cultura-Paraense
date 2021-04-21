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

  int getScore(int timeLeft) {
    final maxScore = rules.level * 1000;
    // How much time is left from the available time
    final timePercentage = timeLeft / rules.time;
    // How much objectives were left from the available objects
    final objectivePercentage = orders.length / rules.allOrders.length;
    final scorePercentage = (timePercentage - objectivePercentage + 1) / 2;
    return (maxScore * scorePercentage).floor().toInt();
  }
}
