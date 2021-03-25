import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jogo_cultura_paraense/pages/score_page.dart';

class FinishedGame extends StatelessWidget {
  static const String routeName = '/finishedGame';
  const FinishedGame({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 60,
              height: 60,
              child: Icon(Icons.check_box, size: 40.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[600],
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(bottom: 35.0),
                child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 300,
                      maxWidth: 300,
                    ),
                    child: Container(
                        color: Colors.grey[600],
                        child: Text(
                          '\nParabéns! Você conseguiu encontrar todos os objetos na cena!\n',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        )))),
            Container(
              width: 60,
              height: 60,
              child: Icon(Icons.help, size: 45.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[600],
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(bottom: 70.0),
                child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 300,
                      maxWidth: 300,
                    ),
                    child: Container(
                        color: Colors.grey[600],
                        child: Text(
                          '\nVocê sabia?\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Para saber mais informações, clique aqui.\n',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        )))),
            Padding(
                padding: const EdgeInsets.only(left: 200.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey[500],
                    ),
                    onPressed: () => _pass(context),
                    child: Icon(Icons.arrow_forward_rounded,
                        color: Colors.black, size: 45.0))),
          ],
        )));
  }

  void _pass(BuildContext context) {
    //print(checkTime());
    Navigator.of(context).pushNamed(ScorePage.routeName);
  }
}
