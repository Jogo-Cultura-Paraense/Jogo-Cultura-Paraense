import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/model/game_save.dart';
import 'package:jogo_cultura_paraense/model/map.dart';
import 'dart:async';
import 'package:jogo_cultura_paraense/pages/score_page.dart';

class MainVocabulario extends StatefulWidget {
  MainVocabularioScreen createState() => MainVocabularioScreen();
}

class MainVocabularioScreen extends State<MainVocabulario> {
  static const String routeName = '/vocabularygame';
  double screenWidth;
  List<String> words = [
    "Baldear",
    "Visagem",
    "Carapanã",
    "Pegar o Beco",
    "Pitiú"
  ]..shuffle();
  List<String> answers = [
    "Mosquito",
    "Ir Embora",
    "Vomitar",
    "Mau Cheiro",
    "Assombração"
  ]..shuffle();
  Color selectedColor = Colors.grey;
  bool selected = false;
  int rightAnswers = 0;
  double score = 0;
  bool usedHint = false;
  int counter = 180;
  Timer timer;
  String countdown;

  @override
  void initState() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (counter > 0) {
          counter--;
        } else {
          Navigator.of(context).popAndPushNamed(
            ScorePage.routeName,
            arguments: ScorePageArgs(
              map: Maps.sudoeste.region,
              game: Games.vocabulary,
              score: score.round(),
              finalScore: score.round(),
              topScore: score.round(),
              time: counter * 1.0,
              prettyTime: counter.toString(),
              hintsLeft: usedHint ? 0 : 1,
              hints: usedHint ? 1 : 0,
            ),
          );
          timer.cancel();
        }
      });
    });
    super.initState();
  }

  List<int> selectedWordsList = [];
  List<int> selectedAnswersList = [];

  void useHint() {
    setState(() {
      usedHint = true;
      score = score - 100;
      words.remove("Visagem");
      answers.remove("Assombração");
      selectedAnswersList.clear();
      selectedWordsList.clear();
    });
  }

  void checkAssociation() {
    if (selectedWordsList.length == 1 && selectedAnswersList.length == 1) {
      String word = words[selectedWordsList[0]];
      String answer = answers[selectedAnswersList[0]];

      if (word == "Baldear") {
        if (answer == "Vomitar") {
          setState(() {
            words.remove("Baldear");
            answers.remove("Vomitar");
            selectedAnswersList.clear();
            selectedWordsList.clear();
            rightAnswers++;
          });
        } else {
          showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                backgroundColor: Color.fromRGBO(233, 10, 10, 1),
                content: Text(
                  'OPS! O signficado desse verbete está errado. \n\n Tente adivinhar pelo contexto: \n\n O menino comeu tanto que é capaz de baldear.',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              );
            },
          );
        }
      }

      if (word == "Pitiú") {
        if (answer == "Mau Cheiro") {
          words.remove("Pitiú");
          answers.remove("Mau Cheiro");
          selectedAnswersList.clear();
          selectedWordsList.clear();
          rightAnswers++;
        } else {
          showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                backgroundColor: Color.fromRGBO(233, 10, 10, 1),
                content: Text(
                  'OPS! O signficado desse verbete está errado. \n\n Tente adivinhar pelo contexto: \n\n É quase impossível ir ao mercado de pescados do Ver-o-Peso e não sentir o Pitiú',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              );
            },
          );
        }
      }

      if (word == "Pegar o Beco") {
        if (answer == "Ir Embora") {
          words.remove("Pegar o Beco");
          answers.remove("Ir Embora");
          selectedAnswersList.clear();
          selectedWordsList.clear();
          rightAnswers++;
        } else {
          showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                backgroundColor: Color.fromRGBO(233, 10, 10, 1),
                content: Text(
                  'OPS! O signficado desse verbete está errado. \n\n Tente adivinhar pelo contexto: \n\n Finalmente meu expediente acabou, tá na hora de Pegar o Beco!',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              );
            },
          );
        }
      }

      if (word == "Visagem") {
        if (answer == "Assombração") {
          words.remove("Visagem");
          answers.remove("Assombração");
          selectedAnswersList.clear();
          selectedWordsList.clear();
          rightAnswers++;
        } else {
          showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                backgroundColor: Color.fromRGBO(233, 10, 10, 1),
                content: Text(
                  'OPS! O signficado desse verbete está errado. \n\n Tente adivinhar pelo contexto: \n\n Que susto! Acho que vi uma visagem.',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              );
            },
          );
        }
      }

      if (word == "Carapanã") {
        if (answer == "Mosquito") {
          words.remove("Carapanã");
          answers.remove("Mosquito");
          selectedAnswersList.clear();
          selectedWordsList.clear();
          rightAnswers++;
        } else {
          showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                backgroundColor: Color.fromRGBO(233, 10, 10, 1),
                content: Text(
                  'OPS! O signficado desse verbete está errado. \n\n Tente adivinhar pelo contexto: \n\n Levei várias picadas de carapanã e agora meu braço está todo vermelho.',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              );
            },
          );
        }
      }

      score = (rightAnswers / 5 * 1000);
      if (usedHint) score -= 100;
    }

    if (words.length == 0) {
      Navigator.of(context).popAndPushNamed(
        ScorePage.routeName,
        arguments: ScorePageArgs(
          map: Maps.sudoeste.region,
          game: Games.vocabulary,
          score: score.round(),
          finalScore: score.round(),
          topScore: score.round(),
          time: counter * 1.0,
          prettyTime: counter.toString(),
          hintsLeft: usedHint ? 0 : 1,
          hints: usedHint ? 1 : 0,
        ),
      );
    }
  }

  List<Widget> wordsListWidget(List listItems) {
    List<Widget> wordsListWidget = [];

    for (var i = 0; i < listItems.length; i++) {
      var iSeleted = selectedWordsList.contains(i);

      var temp = GestureDetector(
        onTap: () {
          setState(() {
            selectedWordsList.clear();
            if (iSeleted) {
              selectedWordsList.remove(i);
            } else {
              selectedWordsList.add(i);
              checkAssociation();
              print(selectedWordsList);
            }
          });
        },
        child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
              width: 175,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: iSeleted ? Colors.blue : Colors.amber,
              ),
              child: Text(listItems[i],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
            )),
      );
      wordsListWidget.add(temp);
    }
    return wordsListWidget;
  }

  List<Widget> answersListWidget(List listItems) {
    List<Widget> answersListWidget = [];

    for (var i = 0; i < listItems.length; i++) {
      var iSeleted = selectedAnswersList.contains(i);

      var temp = GestureDetector(
        onTap: () {
          setState(() {
            selectedAnswersList.clear();
            if (iSeleted) {
              selectedAnswersList.remove(i);
            } else {
              selectedAnswersList.add(i);
              checkAssociation();
              print(selectedAnswersList);
            }
          });
        },
        child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
              width: 175,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: iSeleted ? Colors.blue : Colors.amber,
              ),
              child: Text(listItems[i],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
            )),
      );
      answersListWidget.add(temp);
    }
    return answersListWidget;
  }

  @override
  Widget build(BuildContext context) {
    this.screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.red,
        body: Center(
          child: Column(children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(bottom: 10.0, top: 20.0),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        Text("TEMPO: ${counter}",
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.black)),
                        Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: GestureDetector(
                                onTap: () {
                                  if (!usedHint) useHint();
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black54,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      usedHint
                                          ? Icons.block_outlined
                                          : Icons.lightbulb_outline,
                                      size: 45.0,
                                      color: Colors.white,
                                    )))),
                        Text("PONTUAÇÃO: ${score.round()}",
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.black)),
                      ],
                    ))),
            Center(
              child: Padding(
                  padding: const EdgeInsets.only(bottom: 40.0, top: 40.0),
                  child: GestureDetector(
                    child: Container(
                        width: this.screenWidth / 1.25,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            )
                          ],
                        ),
                        child: Text(
                            'ASSOCIE O VERBETE PARAENSE AO SEU SIGNIFICADO',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 30.0, color: Colors.black))),
                  )),
            ),
            Row(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            )
                          ],
                        ),
                        child: Text('VERBETE',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 30.0, color: Colors.black)))),
                Padding(
                    padding: EdgeInsets.only(left: this.screenWidth / 15),
                    child: Container(
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            )
                          ],
                        ),
                        child: Text(
                          'SIGNIFICADO',
                          style: TextStyle(fontSize: 30.0, color: Colors.black),
                          textAlign: TextAlign.center,
                        ))),
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 5, bottom: 20),
                  child: Icon(Icons.arrow_drop_down_circle_rounded, size: 45.0),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: this.screenWidth / 1.35, bottom: 20),
                  child: Icon(Icons.arrow_drop_down_circle_rounded, size: 45.0),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: wordsListWidget(words),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: answersListWidget(answers),
                    ),
                  ]),
            ),
          ]),
        ));
  }
}
