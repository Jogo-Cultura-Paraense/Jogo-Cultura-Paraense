import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/components/home/buttons_top.dart';
import 'package:jogo_cultura_paraense/components/home/main_menu.dart';
import 'package:jogo_cultura_paraense/pages/map_mode_page.dart';

class GameMode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MenuAppBar(
      bodyWidget: GameModeMenu(),
    );
  }
}

class GameModeMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          'Escolha o modo de jogo',
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
          label: 'MAPA',
          onClick: () => _mapa(context),
        ),
        MainMenuButton(
          label: 'MINI-JOGOS',
          onClick: () => _minigames(context),
        ),
      ],
    );
  }

  void _mapa(BuildContext context) {
    Navigator.of(context).pushNamed(MapModePage.routeName);
    //Navigator.of(context).pushNamed(GameModePage.routeName);
  }

  void _minigames(BuildContext context) {
    print("MINI-JOGOS");
    //Navigator.of(context).pushNamed(EnciclopediaPage.routeName);
  }
}
