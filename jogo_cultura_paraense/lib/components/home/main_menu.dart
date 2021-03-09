import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/components/home/about_alert.dart';
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
              ]),
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

// Widget modelo para criar botões no menu
class MainMenuButton extends StatelessWidget {
  final String label;
  final Function onClick;

  const MainMenuButton({this.label, this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: SizedBox(
        width: double.maxFinite,
        child: RaisedButton(
          child: Text(label),
          onPressed: () => onClick(),
        ),
      ),
    );
  }
}
