
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/games/running_game/mainLendasMitos.dart';
import 'package:jogo_cultura_paraense/games/running_game/attributes.dart' as globals;

class HintsBox extends StatefulWidget {
  HintsBoxScreen createState() => globals.temp4;
}

class HintsBoxScreen extends State<HintsBox> {
  bool usedHint = false;

  @override
  void initState() {
    super.initState();
  }

  void useHint() {
    setState(() {
      usedHint = true;
      globals.temp3.decreaseTarget();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
        onPointerDown: (e) {
          if (!usedHint){
            useHint();
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
}

