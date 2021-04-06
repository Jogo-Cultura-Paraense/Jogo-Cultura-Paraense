import 'package:flutter/material.dart';

class Timer extends StatelessWidget {
  final int timeLimit;

  const Timer({this.timeLimit = 2 * 60, Key key}) : super(key: key);

  String getFormatedTime(int minutes, int seconds) {
    String formatedSec = seconds < 10 ? "0$seconds" : "$seconds";
    return "$minutes:" + formatedSec;
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
          builder: (BuildContext context, Duration value, Widget child) {
            final minutes = value.inMinutes;
            final seconds = value.inSeconds % 60;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                getFormatedTime(minutes, seconds),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
