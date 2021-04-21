import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jogo_cultura_paraense/games/cooking_game/bloc/cooking_game_bloc.dart';
import 'package:jogo_cultura_paraense/model/game.dart';
import 'package:jogo_cultura_paraense/pages/score_page.dart';

class Timer extends StatelessWidget {
  final int timeLimit;

  const Timer({this.timeLimit = 2 * 60, Key key}) : super(key: key);

  String getFormatedTime(int minutes, int seconds) {
    String formatedSec = seconds < 10 ? "0$seconds" : "$seconds";
    return "$minutes:" + formatedSec;
  }

  void toScorePage(BuildContext context, Duration duration, int score) {
    Navigator.of(context).popAndPushNamed(
      ScorePage.routeName,
      arguments: ScorePageArgs(
        game: Games.faunaAndFlora,
        map: "Teste",
        score: score,
        finalScore: score,
        topScore: 0,
        time: duration.inSeconds.toDouble(),
        prettyTime: getFormatedTime(
          duration.inMinutes,
          duration.inSeconds % 60,
        ),
        hintsLeft: 0,
        hints: 0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: TweenAnimationBuilder<Duration>(
          duration: Duration(seconds: timeLimit),
          tween: Tween(begin: Duration(seconds: timeLimit), end: Duration.zero),
          onEnd: () {
            BlocProvider.of<CookingGameBloc>(context).add(FinishGame());
          },
          builder: (BuildContext context, Duration value, Widget child) {
            final minutes = value.inMinutes;
            final seconds = value.inSeconds % 60;
            return BlocListener<CookingGameBloc, CookingGameState>(
              listenWhen: (previousState, currentState) {
                return currentState.status == CookingGameStatus.finished;
              },
              listener: (context, state) {
                if (state.status == CookingGameStatus.finished) {
                  toScorePage(
                    context,
                    value,
                    state.getScore(value.inSeconds),
                  );
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  getFormatedTime(minutes, seconds),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
