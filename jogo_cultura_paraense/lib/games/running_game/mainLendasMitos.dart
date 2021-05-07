import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';
import 'package:jogo_cultura_paraense/games/running_game/gesture_box.dart';

class mainLendasMitos extends StatefulWidget {
  mainLendasMitosScreen createState() => mainLendasMitosScreen();
}

class mainLendasMitosScreen extends State<mainLendasMitos> {
  static String routeName = '/lendasMitos';
  int time = 300;
  int lifesLast = 3;
  var timer;
  var game;

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (time > 0) {
          time--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  @override
  dispose() {
    timer.cancel();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  Widget targetsBox() {
    return Flexible(
        flex: 30,
        child: FractionallySizedBox(
            widthFactor: 0.5,
            heightFactor: 0.2,
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [Icon(Icons.camera_alt, color: Colors.white)],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('2 X Iara',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0)),
                        Text('2 X Curupira',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0)),
                        Text('2 X Matinta',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0)),
                      ],
                    )
                  ],
                ))));
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
                  child: Text(
                'Tempo:  ${time}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ))),
        ));
  }

  Widget lifeBox() {
    return Flexible(
        flex: 15,
        child: FractionallySizedBox(
          widthFactor: 0.9,
          heightFactor: 0.15,
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
              child: Center(
                  child: Column(children: [
                Text(
                  'Vidas restantes:',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                Flexible(
                    child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: lifesLast,
                  itemBuilder: (BuildContext context, int index) {
                    return Icon(Icons.favorite, color: Colors.white);
                  },
                ))
              ]))),
        ));
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
          children: [targetsBox(), timeBox(), lifeBox()],
        ),
        game.widget,
      ],
    ));
  }
}
