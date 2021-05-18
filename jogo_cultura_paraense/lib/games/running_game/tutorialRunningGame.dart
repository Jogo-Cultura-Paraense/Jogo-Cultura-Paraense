import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/games/running_game/mainLendasMitos.dart';

class TutorialRunningGame extends StatefulWidget {
  TutorialRunningGame({Key key}) : super(key: key);

  @override
  TutorialRunningGameScreen createState() => TutorialRunningGameScreen();

}


class TutorialRunningGameScreen extends State<TutorialRunningGame> {

  static const String routeName = '/tutorialRunningGame';
  //ImageProvider<Object> mapImage = AssetImage("lib/images/mesoregioes.png");

  int counter = 0;
  List<String> texts = ["Bem-vindo ao jogo das Lendas e Mitos",
    "Você é um turista em uma trilha na Floresta Amazônica e precisa tirar fotos dos personagens dos folclores paraenses",
    "Você terá uma lista com as lendas e os mitos que deve fotografar",
    "Para tirar a foto, basta encostar no alvo",
    "Porém, aparecerão obstáculos no meio do caminho",
    "Para desviar dos obstáculos, deslize para outra pista",
    "Você ganha se conseguir fotografar todas as lendas e mitos antes de o tempo esgotar! \n Está pronto?"
  ];

  int level;

  @override
  Widget build(BuildContext context) {
    level = ModalRoute.of(context).settings.arguments;
    setState(() {
      level = ModalRoute.of(context).settings.arguments;
    });
    return Scaffold(
        backgroundColor: Colors.red,
        body: Center (
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Text(
                      '${texts[counter]}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      )
                  ),
                  Visibility(
                    visible: counter < 6,
                    child:  ButtonTheme(
                      minWidth: 5.0,
                      buttonColor: Colors.red[700],
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            counter++;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                        ),
                        child: Text(
                          '>',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                      visible: counter >= 6,
                      child: RaisedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                                mainLendasMitosScreen.routeName,
                                arguments: level
                            );
                          },
                          child: Text(
                              'JOGAR'
                          )
                      )
                  )


                ]
            )
        )
    );
  }



}