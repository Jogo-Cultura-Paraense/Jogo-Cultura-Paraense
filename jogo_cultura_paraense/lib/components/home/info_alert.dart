import 'package:flutter/material.dart';

class InfoAlert extends StatelessWidget {
  const InfoAlert({Key key}) : super(key: key);

  String _getInfo() {
    return 'Está de tarde! Durante essa hora do dia, todos os dias ocorrem chuvas torrenciais em Belém do Pará, principalmente entre os meses de Janeiro e Maio.';
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          height: 300,
          width: 400,
          child: AlertDialog(
            backgroundColor: Theme.of(context).primaryColor,
            title: Text(
              'Você sabia?',
              textAlign: TextAlign.center,
            ),
            content: Text(
              _getInfo(),
              textAlign: TextAlign.center,
            ),
            titlePadding: EdgeInsets.only(top: 30),
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            contentTextStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        Container(
          height: 280,
          width: 400,
          alignment: Alignment.topCenter,
          child: FloatingActionButton(
            child: Icon(Icons.help),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
