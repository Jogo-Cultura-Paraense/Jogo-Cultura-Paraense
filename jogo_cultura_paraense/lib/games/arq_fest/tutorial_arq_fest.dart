import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/games/arq_fest/select_arq_fest.dart';

class TutorialArqFest extends StatefulWidget {
  TutorialArqFest({Key key}) : super(key: key);

  @override
  TutorialArqFestScreen createState() => TutorialArqFestScreen();

}


class TutorialArqFestScreen extends State<TutorialArqFest> {

  static const String routeName = '/tutorialArqFest';
  ImageProvider<Object> mapImage = AssetImage("lib/images/mesoregioes.png");

  int counter = 0;
  List<String> texts = ["Bem-vindo ao jogo das Arquiteturas e Festividades",
    "Seu objetivo é montar um quebra-cabeça de uma arquitetura ou festividade paraense",
    "Na parte de cima da tela, aparecerão as peças embaralhadas",
    "Você deve arrastá-las até a posição correta nos quadrados cinza",
    "Se não for o lugar certo, a peça retornará ao seu lugar",
    "Se for, a peça ficará devidamente posicionada.",
    "No final, você terá a imagem da arquitetura ou festividade paraense! Está pronto?"
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
                  Image.asset(counter == 2 ? "lib/images/tutorialarqfest1.png" :
                  counter == 3 ? "lib/images/tutorialarqfest2.png" :
                  counter == 5 ? "lib/images/tutorialarqfest3.png" :
                  counter == 6 ? "lib/images/tutorialarqfest4.png" :
                  ""
                  ),
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
                                SelectArqFest.routeName,
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
