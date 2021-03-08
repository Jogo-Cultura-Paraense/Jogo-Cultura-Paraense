import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/components/home/home_appbar.dart';
import 'package:jogo_cultura_paraense/components/home/home_scaffold.dart';
import 'package:jogo_cultura_paraense/components/main_menu_button.dart';
import 'package:jogo_cultura_paraense/pages/select_mini_game_page.dart';
import 'package:jogo_cultura_paraense/pages/region_mode_page.dart';

class GameModePage extends StatelessWidget {
  static const String routeName = '/gameMode';

  const GameModePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      appBar: HomeAppBar(),
      body: const GameModeMenu(),
    );
  }
}

class GameModeMenu extends StatelessWidget {
  const GameModeMenu({Key key}) : super(key: key);

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
            ],
          ),
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
    Navigator.of(context).pushNamed(RegionModePage.routeName);
  }

  void _minigames(BuildContext context) {
    print("MINI-JOGOS");
    Navigator.of(context).pushNamed(GameSelectionPage.routeName);
  }
}
