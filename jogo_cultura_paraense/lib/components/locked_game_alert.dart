import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/components/alert_dialog.dart';

class LockedGameAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      content: Text(
        "Este nível de dificuldade ainda não foi desbloqueado para esse jogo. Continue jogando no mapa para desbloqueá-lo.",
        style: TextStyle(fontSize: 16),
        textAlign: TextAlign.justify,
      ),
      title: const Text(
        "JOGO BLOQUEADO",
        textAlign: TextAlign.center,
      ),
      floatingChild: FloatingActionButton(
        child: Icon(Icons.lock),
        onPressed: () {},
      ),
    );
  }
}