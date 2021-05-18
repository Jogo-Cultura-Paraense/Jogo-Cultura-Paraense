
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/games/running_game/mainLendasMitos.dart';

class TargetsBox extends StatefulWidget {
  TargetsBoxScreen createState() => TargetsBoxScreen.instance;
}

class TargetsBoxScreen extends State<TargetsBox> {
  int targets = 3;
  TargetsBoxScreen._privateConstructor();

  static final TargetsBoxScreen _instance = TargetsBoxScreen._privateConstructor();

  static TargetsBoxScreen get instance => _instance;

  @override
  void initState() {
    super.initState();
  }

  void decreaseTarget() {
    setState(() {
      this.targets--;
    });
    if (this.targets == 0) {
      setState(() {
        mainLendasMitosScreen temp = mainLendasMitosScreen.instance;
        temp.endGame();

      });

    }
  }

  @override
  Widget build(BuildContext context) {
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
                        Text('${targets}X Curupira',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0)),
                      ],
                    )
                  ],
                ))));
  }
}

