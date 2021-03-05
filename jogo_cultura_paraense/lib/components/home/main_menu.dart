import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/components/alert_dialog.dart';
import 'package:jogo_cultura_paraense/components/main_menu_button.dart';
import 'package:jogo_cultura_paraense/pages/enciclopedia_page.dart';
import 'package:jogo_cultura_paraense/pages/game_mode_page.dart';
import 'package:jogo_cultura_paraense/pages/pages.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          'Jogo Cultura Paraense',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: <Shadow>[
              Shadow(
                offset: Offset(1.0, 1.0),
                blurRadius: 2.0,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              Shadow(
                offset: Offset(1.0, 1.0),
                blurRadius: 1.0,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ],
          ),
        ),
        MainMenuButton(
          label: 'JOGAR',
          onClick: () => _game(context),
        ),
        MainMenuButton(
          label: 'ENCICLOPÉDIA',
          onClick: () => _enciclopedia(context),
        ),
        MainMenuButton(
          label: 'CONFIGURAÇÕES',
          onClick: () => _settings(context),
        ),
        MainMenuButton(
          label: 'SOBRE',
          onClick: () => _about(context),
        ),
      ],
    );
  }

  void _game(BuildContext context) {
    Navigator.of(context).pushNamed(GameModePage.routeName);
  }

  void _enciclopedia(BuildContext context) {
    Navigator.of(context).pushNamed(EnciclopediaPage.routeName);
  }

  void _settings(BuildContext context) {
    //print(checkTime());
    print('settings...');
  }

  void _about(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return const AboutAlert();
      },
    );
  }
}

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
