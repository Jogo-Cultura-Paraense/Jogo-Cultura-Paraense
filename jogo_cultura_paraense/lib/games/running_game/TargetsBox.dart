
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/games/running_game/mainLendasMitos.dart';
import 'package:jogo_cultura_paraense/games/running_game/attributes.dart' as globals;

class TargetsBox extends StatefulWidget {
  TargetsBoxScreen createState() => globals.temp3;
}

class TargetsBoxScreen extends State<TargetsBox> {
  int targets = 3;
  bool usedHint = false;


  @override
  void initState() {
    super.initState();
  }



  Widget hint() {
    return Listener(
        onPointerDown: (e) {
          if (!usedHint){
            setState(() {
              usedHint =true;
              decreaseTarget();
            });
          }
        },
        child: Container(
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: Icon(
              usedHint
                  ? Icons.block_outlined
                  : Icons.lightbulb_outline,
              size: 45.0,
              color: Colors.white,
            )));
  }

  void decreaseTarget() {
    setState(() {
      this.targets--;
    });
    if (this.targets == 0) {
      setState(() {
        globals.temp.endGame();

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

