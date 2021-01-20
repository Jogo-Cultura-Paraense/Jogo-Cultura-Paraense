import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/components/alert_dialog.dart';

class InfoAlert extends StatelessWidget {
  const InfoAlert({Key key}) : super(key: key);

  String _getInfo() {
    return 'Está de tarde! Durante essa hora do dia, todos os dias ocorrem chuvas torrenciais em Belém do Pará, principalmente entre os meses de Janeiro e Maio.';
  }

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      title: Text(
        'Você sabia?',
        textAlign: TextAlign.center,
      ),
      content: Text(
        _getInfo(),
        textAlign: TextAlign.center,
      ),
      floatingChild: FloatingActionButton(
        child: Icon(Icons.help),
        onPressed: () {},
      ),
    );
  }
}
