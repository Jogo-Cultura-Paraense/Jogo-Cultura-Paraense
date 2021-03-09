import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/components/home/buttons_top.dart';
import 'package:jogo_cultura_paraense/components/locked_game_alert.dart';
import 'package:jogo_cultura_paraense/games/artesanato-fauna-flora/find_game.dart';
import 'package:jogo_cultura_paraense/pages/pages.dart';
import 'package:jogo_cultura_paraense/pages/select_mini_game.dart';

class LevelSelection extends StatelessWidget {
  static const String routeName = '/levelSelect';
  final GameObject gameObject;

  const LevelSelection({Key key, this.gameObject}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MenuAppBar(
      bodyWidget: LevelSelectionMenu(
        gameObject: gameObject,
      ),
    );
  }
}

class LevelSelectionMenu extends StatelessWidget {
  final GameObject gameObject;

  const LevelSelectionMenu({Key key, this.gameObject}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 275.0,
              height: 60.0,
              child: Card(
                color: Colors.redAccent[700],
                child: Center(
                  child: Text(
                    gameObject.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 350.0,
              height: 600.0,
              child: Card(
                color: Colors.redAccent[700],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 32.0),
                      child: Text(
                        "ESCOLHA UM NÍVEL",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SelectLevelCard(
                      level: 1,
                      unlocked: true,
                      onTap: () => _game(context),
                    ),
                    SelectLevelCard(
                      level: 2,
                      unlocked: true,
                      onTap: () => print("level 2"),
                    ),
                    SelectLevelCard(
                      level: 3,
                      unlocked: false,
                      onTap: () => print("level 3 bloqueado"),
                    ),
                    SelectLevelCard(
                      level: 4,
                      unlocked: false,
                      onTap: () => print("level 4 bloqueado"),
                    ),
                    SelectLevelCard(
                      level: 5,
                      unlocked: false,
                      onTap: () => print("level 5 bloqueado"),
                    ),
                    SelectLevelCard(
                      level: 6,
                      unlocked: false,
                      onTap: () => print("level 6 bloqueado"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _game(BuildContext context) {
    Navigator.of(context).pushNamed(FindGame.routeName);
    //Navigator.of(context).pushNamed(GameModePage.routeName);
  }
}

class SelectLevelCard extends StatelessWidget {
  const SelectLevelCard(
      {Key key, this.title, this.onTap, this.level, this.unlocked})
      : super(key: key);
  final String title;
  final Function onTap;
  final int level;
  final bool unlocked;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300.0,
        height: 75.0,
        child: Card(
          color: unlocked ? Colors.white : Colors.blueGrey[200],
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () => unlocked ? onTap() : _lockedGame(context),
            child: Center(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: level,
                itemBuilder: (BuildContext context, int index) {
                  return Icon(
                    Icons.star,
                    size: 32,
                    color: unlocked ? Colors.black : Colors.blueGrey[300],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void _lockedGame(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return LockedGameAlert();
    },
  );
}
