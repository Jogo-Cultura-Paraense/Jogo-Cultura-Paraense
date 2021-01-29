import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/components/alert_dialog.dart';

class AboutAlert extends StatelessWidget {
  const AboutAlert({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      title: null,
      // Changing the string structure will change how it is displayed
      content: Text(
        '''Cultura Paraense Game é um projeto do Laboratório SPIDER que busca o ensinamento dinâmico de cultura paraense de forma lúdica.
Graduandos: Alberto Sobrinho
                        Felipe Oliveira
                        Tuby Neto
Professor Doutor: Sandro Bezerra''',
        style: TextStyle(fontSize: 15),
        textAlign: TextAlign.justify,
      ),
      floatingChildHeight: 260,
      floatingChild: ElevatedButton(
        child: Text(
          'Sobre o jogo',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: Theme.of(context).primaryColor,
          onPrimary: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
