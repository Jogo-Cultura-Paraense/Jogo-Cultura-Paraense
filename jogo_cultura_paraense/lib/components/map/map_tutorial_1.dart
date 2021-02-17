import 'package:flutter/material.dart';

class MapFirstTutorial extends StatefulWidget {
  final String _city;
  final String _region;
  final Function _onAction;

  const MapFirstTutorial({
    @required String city,
    @required String region,
    @required Function onAction,
    Key key,
  })  : _city = city,
        _region = region,
        _onAction = onAction,
        super(key: key);

  @override
  _MapFirstTutorialState createState() => _MapFirstTutorialState();
}

class _MapFirstTutorialState extends State<MapFirstTutorial> {
  int currentText = 0;

  List<String> _buildTexts() {
    return <String>[
      'Olá, eu sou o Maninho e vou te guiar ao longo dessa jornada Papa-Chibé!',
      'O mapa que será mostrado a seguir é o de ${widget._city}, o maior município da região do ${widget._region}.',
      'Em cada ponto do mapa, você jogará um jogo e cada jogo representa um aspecto diferente da cultura paraense.',
      'Você aprenderá sobre a culinária, arquitetura, festividades, fauna e flora, lendas e mitos, vocabulário e músicas de forma bem divertida!',
      'Conclua um jogo para desbloquear o próximo no caminho ilustrado no mapa. No final de todos, você desbloqueará uma nova região paraense!'
    ];
  }

  @override
  Widget build(BuildContext context) {
    final texts = _buildTexts();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          AlertDialog(
            buttonPadding: EdgeInsets.zero,
            backgroundColor: Color.fromRGBO(233, 213, 136, 1),
            content: Text(
              texts[currentText],
              textAlign: TextAlign.center,
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.forward),
                onPressed: () {
                  if (currentText == texts.length - 1) {
                    widget._onAction();
                  } else {
                    setState(() {
                      currentText += 1;
                    });
                  }
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
