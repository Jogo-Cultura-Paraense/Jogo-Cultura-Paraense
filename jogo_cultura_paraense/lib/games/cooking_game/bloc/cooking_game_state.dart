part of 'cooking_game_bloc.dart';

enum CookingGameStatus { ready, running, finished }

@immutable
class CookingGameState {
  final CookingGameStatus status;
  final List<Order> orders;
  final int hints;
  final CookingGameRules rules;

  CookingGameState({
    @required this.status,
    @required this.orders,
    @required this.rules,
    this.hints = 0,
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
    int hints,
  }) {
    return CookingGameState(
      status: status ?? this.status,
      orders: orders ?? this.orders,
      hints: hints ?? this.hints,
      rules: this.rules,
    );
  }

  int getScore(int timeLeft) {
    final maxScore = rules.level * 1000;
    // How much time is left from the available time
    final timePercentage = timeLeft / rules.time;
    // How much objectives were left from the available objects
    final objectivePercentage = orders.length / rules.allOrders.length;
    // How closer to the maximum score the actual score is
    final scorePercentage = (timePercentage - objectivePercentage + 1) / 2;
    final score = maxScore * scorePercentage;
    return score.floor();
  }

  int getFinalScore(int timeLeft) {
    final maxScore = rules.level * 1000;
    final score = getScore(timeLeft);
    // Points are removed based on how many hints were used
    final finalScore = score - (0.1 * maxScore * hints);
    return finalScore.floor();
  }
}
