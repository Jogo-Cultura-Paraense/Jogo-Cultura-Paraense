part of 'running_game_bloc.dart';

enum RunningGameStatus { ready, running, finished }

@immutable
class RunningGameState {
  final RunningGameStatus status;
  final List<Legend> legends;
  final int hints;
  final int lifes;
  final RunningGameRules rules;

  RunningGameState({
    @required this.status,
    @required this.legends,
    @required this.rules,
    @required this.lifes,
    this.hints = 0,
  });

  factory RunningGameState.initFromRules({RunningGameRules rules}) {
    return RunningGameState(
      status: RunningGameStatus.ready,
      legends: List.from(rules.legends),
      lifes: 3,
      rules: rules,
    );
  }

  RunningGameState copyWith({
    RunningGameStatus status,
    List<Legend> legends,
    int hints,
    int lifes,
  }) {
    return RunningGameState(
      status: status ?? this.status,
      legends: legends ?? this.legends,
      hints: hints ?? this.hints,
      lifes: lifes ?? this.lifes,
      rules: this.rules,
    );
  }

  int getScore(int timeLeft) {
    final maxScore = rules.level * 1000;
    // How much time is left from the available time
    final timePercentage = timeLeft / rules.time;
    // How much objectives were left from the available objects
    final objectivePercentage = legends.length / rules.legends.length;
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
