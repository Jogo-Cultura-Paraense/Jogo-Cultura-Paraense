import 'package:flutter/material.dart';

class CookingGame extends StatelessWidget {
  const CookingGame({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      height: deviceHeight,
      width: deviceWidth,
      decoration: BoxDecoration(color: Colors.grey[200]),
      child: Column(
        children: [
          Clock(),
          RecipeList(
            height: deviceHeight / 6,
            width: deviceWidth,
          ),
          Expanded(
            child: Container(
              color: Colors.yellow,
            ),
          ),
          Container(
            height: deviceHeight / 6,
            width: deviceWidth,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}

class RecipeList extends StatelessWidget {
  final double height;
  final double width;

  const RecipeList({
    @required this.height,
    @required this.width,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: Colors.transparent,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(5.0),
            height: height,
            width: width / 3,
            color: Colors.green,
          );
        },
      ),
    );
  }
}

class Clock extends StatefulWidget {
  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  int _time = 10;

  String getFormatedTime(int minutes, int seconds) {
    String formatedSec =
        seconds < 10 ? "0" + seconds.toString() : seconds.toString();
    return minutes.toString() + ":" + formatedSec;
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
          duration: Duration(seconds: _time),
          tween: Tween(begin: Duration(seconds: _time), end: Duration.zero),
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
