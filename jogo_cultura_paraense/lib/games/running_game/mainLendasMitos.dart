import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';
import 'package:jogo_cultura_paraense/games/running_game/gesture_box.dart';
import 'package:jogo_cultura_paraense/games/running_game/CountDownTimer.dart';
import 'package:jogo_cultura_paraense/games/running_game/attributes.dart' as globals;
import 'package:jogo_cultura_paraense/games/running_game/LifeBox.dart';
import 'package:jogo_cultura_paraense/games/running_game/TargetsBox.dart';
import 'package:jogo_cultura_paraense/pages/score_page.dart';
import 'package:jogo_cultura_paraense/model/game.dart';
import 'package:jogo_cultura_paraense/model/map.dart';

class mainLendasMitos extends StatefulWidget {
  mainLendasMitosScreen createState() => mainLendasMitosScreen.instance;
}

class mainLendasMitosScreen extends State<mainLendasMitos> {
  static String routeName = '/lendasMitos';
  int time = 300;
  int lifesLast = 3;
  var timer;
  var game;
  var hasTimerStopped;
  double score = 100.0;
  LifeBoxScreen temp = LifeBoxScreen.instance;


  mainLendasMitosScreen._privateConstructor();
  static final mainLendasMitosScreen _instance = mainLendasMitosScreen._privateConstructor();
  static mainLendasMitosScreen get instance => _instance;
  static void set instance(value) { instance = null; }

  @override
  void initState() {
    super.initState();


    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    /*
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (time > 0) {
          time--;
        } else {
          timer.cancel();
        }
      });
    });*/
  }

  @override
  dispose() {
    //timer.cancel();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    super.dispose();
    //Navigator.of(context).popUntil(ModalRoute.withName('/'));



  }

  void endGame() {


    Navigator.of(context).popAndPushNamed(
      ScorePage.routeName,
      arguments: ScorePageArgs(
        map: Maps.sudoeste.region,
        game: Games.vocabulary,
        score: score.round(),
        finalScore: score.round(),
        topScore: score.round(),
        time: 1 * 1.0,
        prettyTime: 1.toString(),
        hintsLeft: true ? 0 : 1,
        hints: true ? 1 : 0,
      ),
    );
  }



  Widget timeBox() {
    return Flexible(
        flex: 15,
        child: FractionallySizedBox(
          widthFactor: 0.5,
          heightFactor: 0.15,
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
              child: Center(
                child: CountDownTimer(
                  secondsRemaining: 30,
                  whenTimeExpires: () {
                    setState(() {
                      endGame();
                    });
                  },


              )),
        )));
  }


  @override
  Widget build(BuildContext context) {
    GestureBox game = GestureBox(
        MediaQuery.of(context).size.height, MediaQuery.of(context).size.width);

    return Scaffold(
        body: Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [TargetsBox(), timeBox(), LifeBox()],
        ),
        game.widget,
      ],
    ));
  }
}
