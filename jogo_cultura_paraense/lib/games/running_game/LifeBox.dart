
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/games/running_game/mainLendasMitos.dart';

class LifeBox extends StatefulWidget {
  LifeBoxScreen createState() => LifeBoxScreen.instance;
}

class LifeBoxScreen extends State<LifeBox> {
  int lives = 3;
  LifeBoxScreen._privateConstructor();

  static final LifeBoxScreen _instance = LifeBoxScreen._privateConstructor();

  static LifeBoxScreen get instance => _instance;

  @override
  void initState() {
    super.initState();
  }




  void decreaseLife() {
    setState(() {
      this.lives--;
    });
    if (lives == 0) {
      setState(() {
        mainLendasMitosScreen temp = mainLendasMitosScreen.instance;
        temp.endGame();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: lives == 1 ? [
                            Icon(Icons.favorite, color: Colors.white)
                          ] : lives == 2 ? [
                            Icon(Icons.favorite, color: Colors.white), Icon(Icons.favorite, color: Colors.white)
                          ] : lives == 3 ? [
                            Icon(Icons.favorite, color: Colors.white), Icon(Icons.favorite, color: Colors.white), Icon(Icons.favorite, color: Colors.white)
                          ] : [],
                        )
                    )
                  ]))),
        ));
  }
}

