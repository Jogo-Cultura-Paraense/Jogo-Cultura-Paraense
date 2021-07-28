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
  List<String> texts = [
    "Bem-vindo ao jogo das Arquiteturas e Festividades",
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

    final children = <Widget>[];
    switch (counter) {
      case 2:
        children.add(
          Image.asset("lib/images/tutorialarqfest1.jpeg"),
        );
        break;
      case 3:
        children.add(
          Image.asset("lib/images/tutorialarqfest2.jpeg"),
        );
        break;
      case 4:
        children.add(
          Image.asset("lib/images/tutorialarqfest3.jpeg"),
        );
        break;
      case 5:
        children.add(
          Image.asset("lib/images/tutorialarqfest4.jpeg"),
        );
        break;
      case 6:
        break;
      default:
        break;
    }

    children.addAll(<Widget>[
      Text(
        '${texts[counter]}',
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      Visibility(
        visible: counter < 6,
        child: ButtonTheme(
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
            Navigator.of(context)
                .pushNamed(SelectArqFest.routeName, arguments: level);
          },
          child: Text('JOGAR'),
        ),
      )
    ]);

    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }
}
