import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jogo_cultura_paraense/games/art-fauna-flora/art_fauna_flora_game.dart';
import 'package:jogo_cultura_paraense/pages/home_page.dart';

class ScorePage extends StatelessWidget {
  static const String routeName = '/scorePage';
  const ScorePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ArtFaunaFloraGame game = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20.0),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Container(
                  width: 60,
                  height: 60,
                  child: Icon(Icons.lock_open_rounded, size: 40.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  color: Colors.grey[600],
                  child: Text(
                    '\nNovas Palavras Desbloqueadas na Enciclopédia Papa Chibé. Clique aqui para abrir a Enciclopédia.\n',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: Container(
                  width: 60,
                  height: 60,
                  child: Icon(Icons.star, size: 45.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  color: Colors.grey[600],
                  child: Text(
                    '\nPONTUAÇÃO: \n\nJogo Concluído: \t\t\t\t ${game.scoreDisplay.score}pts  \nTempo Restante: \t\t\t\t ${game.timer.format(game.timer.currentTime)} segundos \nDicas Usadas: \t\t\t\t ${game.hintButton.hintsLeft}\nTotal de Dicas: \t\t\t\t x2\n\n TOTAL: ${game.scoreDisplay.score} / ${game.topScore} \n',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.yellow,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Container(
                        child: Text(
                          "\n PAI D'ÉGUA!!!  \n",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: ElevatedButton(
                        onPressed: () => _pass(context),
                        child: Icon(
                          Icons.arrow_forward_rounded,
                          color: Colors.black,
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.grey[600],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _calculeScore() {}

  void _pass(BuildContext context) {
    //print(checkTime());
    Navigator.of(context).popUntil(
      (route) => route.settings.name == HomePage.routeName,
    );
  }
}
