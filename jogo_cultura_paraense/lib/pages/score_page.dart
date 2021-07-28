import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jogo_cultura_paraense/bloc/save/save_bloc.dart';
import 'package:jogo_cultura_paraense/pages/select_mini_game_page.dart';
import 'package:jogo_cultura_paraense/pages/maps/sudoeste.dart';
import 'package:jogo_cultura_paraense/pages/maps/sudeste.dart';
import 'package:jogo_cultura_paraense/pages/maps/baixo_amazonas.dart';
import 'package:jogo_cultura_paraense/pages/maps/metropolitana.dart';
import 'package:jogo_cultura_paraense/pages/maps/nordeste.dart';
import 'package:jogo_cultura_paraense/pages/maps/marajó.dart';

class ScorePageArgs {
  final String game;
  final String map;
  final int score;
  final double time;
  final String prettyTime;
  final int hints;
  final int hintsLeft;
  final int finalScore;
  final int topScore;
  final List<String> newItems;

  const ScorePageArgs({
    @required this.game,
    @required this.map,
    @required this.score,
    @required this.time,
    @required this.prettyTime,
    @required this.hints,
    @required this.hintsLeft,
    @required this.finalScore,
    @required this.topScore,
    this.newItems,
  });

  factory ScorePageArgs.initial() {
    return ScorePageArgs(
      game: "",
      map: "",
      score: 0,
      time: 0,
      prettyTime: '0',
      hints: 0,
      hintsLeft: 0,
      finalScore: 1,
      topScore: 2,
    );
  }
}

class ScorePage extends StatelessWidget {
  static const String routeName = '/scorePage';
  const ScorePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScorePageArgs args =
        ModalRoute.of(context).settings.arguments ?? ScorePageArgs.initial();

    final gameSummary = '''
    \nPONTUAÇÃO
    Jogo concluído
    Tempo Restante: ${args.prettyTime} 
    Dicas Restantes: ${args.hintsLeft} / ${args.hints}
    TOTAL: ${args.finalScore} / ${1000}
    HIGH SCORE: ${args.topScore > 1000 ? args.topScore - 50 : 1000} 
    ''';

    String interjection = "\nPai D'égua\n";
    if (args.time <= 0) {
      interjection = '\nLevou o Farelo!\n';
    } else if (args.topScore < args.finalScore) {
      interjection = "\nÉ-G-U-A\n";
    }

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
                padding: EdgeInsets.symmetric(vertical: 1.0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  color: Colors.grey[600],
                  child: Text(
                    gameSummary,
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
                      child: Image.asset('assets/images/Maninho.jpg'),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Container(
                        child: Text(
                          interjection,
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
                        onPressed: () => pass(
                          context,
                          args.time,
                          args.map,
                          args.game,
                          args.score,
                          args.newItems ?? [],
                        ),
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

  void pass(
    BuildContext context,
    double time,
    String map,
    String game,
    int score,
    List<String> itens,
  ) {
    if (time > 0) {
      BlocProvider.of<SaveBloc>(context).add(
        SaveClearedGame(
          map,
          game,
          score: score,
          itens: itens,
        ),
      );
    }

    Navigator.of(context).popUntil(
      (route) =>
          (route.settings.name == GameSelectionPage.routeName) ||
          (route.settings.name == SudoestePage.routeName) ||
          (route.settings.name == BaixoAmazonasPage.routeName) ||
          (route.settings.name == SudestePage.routeName) ||
          (route.settings.name == NordestePage.routeName) ||
          (route.settings.name == MarajoPage.routeName) ||
          (route.settings.name == MetropolitanaPage.routeName),
    );
  }
}
