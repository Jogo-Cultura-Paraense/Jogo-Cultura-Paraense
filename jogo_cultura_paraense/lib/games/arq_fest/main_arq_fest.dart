import 'package:flutter/material.dart';
import 'dart:async';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:jogo_cultura_paraense/pages/score_page.dart';
import 'package:audioplayers/audio_cache.dart';

class MainArqFest extends StatefulWidget {
  MainArqFest({Key key}) : super(key: key);

  @override
  MainArqFestScreen createState() => MainArqFestScreen();

}

class MainArqFestScreen extends State<MainArqFest> {

  AudioCache player = AudioCache();
  bool usedHint = false;
  int timer;
  double score = 0;
  double screenWidth;
  int counter = 0;
  var tim;
  int level;
  int maxCounter;
  bool rightPosition = false;
  List<String> partsPaths = [];
  List<bool> rightPos = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false];
  List<String> shuffledParts = [];
  static const String routeName = '/arqfestgame';

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      setState(() {
        final args = ModalRoute.of(context).settings.arguments as Map<String, List<String>>;
        partsPaths = args['images'];
        timer = int.parse(args['time'][0]);
        level = int.parse(args['level'][0]);
        maxCounter = timer;
        shuffledParts = new List<String>.from(partsPaths)..shuffle();




        tim = Timer.periodic(Duration(seconds: 1), (tim) {
          setState(() {
            if (timer != maxCounter && timer % 10 == 0) {
              score-=10*level;
            }
            if (timer > 0) {
              timer--;
            } else {
              Navigator.of(context).popAndPushNamed(
                  ScorePage.routeName,
                  arguments: ScorePageArgs(

                    score: score > 1000*level ? 1000*level : score.round(),
                    finalScore: score > 1000*level ? 1000*level : score.round(),
                    topScore: 1000*level,
                    time: counter * 1.0,
                    prettyTime: timer.toString(),
                    hintsLeft: usedHint ? 0 : 1,
                    hints: usedHint ? 1 : 0,
                  )
              );
              tim.cancel();
            }
          });
        });
      });
    });
    super.initState();
  }

  @override
  void setState(fn) {
    if(mounted) {
      super.setState(fn);
    }
  }

  var dropBox = Container(
    margin: const EdgeInsets.all(1.0),
    color: Colors.grey,
    width: 90.0,
    height: 90.0,
  );

  Widget buildDragTarget(String directory, int index) {

    return DragTarget<String>(
      onWillAccept: (data) => data == directory,
      onAccept: (data) {
        setState(() {
          player.play('sounds/completetask_0.mp3');
          print(index);
          rightPos[index] = true;
          shuffledParts.remove(directory);
          score += 66.7*level;
          if (shuffledParts.length == 0) {
            player.play('sounds/win_sound.wav');
            Future.delayed(Duration(seconds: 2), () {
            Navigator.of(context).popAndPushNamed(
                ScorePage.routeName,
                arguments: ScorePageArgs(

                score: score > 1000*level ? 1000*level : score.round(),
                finalScore: score > 1000*level ? 1000*level : score.round(),
                topScore: 1000*level,
                time: counter * 1.0,
                prettyTime: timer.toString(),
                hintsLeft: usedHint ? 0 : 1,
                hints: usedHint ? 1 : 0,
              )
            );
          });
        }});
      },


      builder: (BuildContext context, List<String> incoming, List rejected) {
        if (rightPos[index]) {
          return
            Container(
              width: 90.0,
              height: 90.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(directory),
                ),
              ),
            );

        } else {
          return dropBox;
        }

      },

    );
  }

  void useHint() {
    setState(() {
      usedHint = true;
      rightPos[0] = true;
      score += 66.7*level;
      shuffledParts.remove(partsPaths[0]);
    });
  }


  Widget build (BuildContext context) {
    this.screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.red,
      body: Center(
          child: Column(
              children: <Widget>[
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
                    Text("TEMPO: ${timer}",
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
                )
            )
        ),
                Center(
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 40.0, top: 40.0),

                        child: Container(
                            width: this.screenWidth / 1.05,
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
                          child: CarouselSlider(
                              options: CarouselOptions(
                                height: 100.0,

                                viewportFraction: shuffledParts.length <=2 ?  0.7 : 0.5,
                              ),
                            items: shuffledParts.map((it) {
                              return
                                Container (
                                 child: Draggable<String>(data: it, child: Image.asset(it, height: 90.0, width: 90.0), feedback: Image.asset(it, height: 100.0, width: 90.0), childWhenDragging: Container())
                              );
                            }).toList()
                          )
                        ),
                      ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildDragTarget(partsPaths[0], 0),
                      buildDragTarget(partsPaths[1], 1),
                      buildDragTarget(partsPaths[2], 2),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0.1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildDragTarget(partsPaths[3], 3),
                      buildDragTarget(partsPaths[4], 4),
                      buildDragTarget(partsPaths[5], 5),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0.1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildDragTarget(partsPaths[6], 6),
                      buildDragTarget(partsPaths[7], 7),
                      buildDragTarget(partsPaths[8], 8),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0.1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildDragTarget(partsPaths[9], 9),
                      buildDragTarget(partsPaths[10], 10),
                      buildDragTarget(partsPaths[11], 11),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0.1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildDragTarget(partsPaths[12], 12),
                      buildDragTarget(partsPaths[13], 13),
                      buildDragTarget(partsPaths[14], 14),
                    ],
                  ),
                )
      ])
    ));
  }
}