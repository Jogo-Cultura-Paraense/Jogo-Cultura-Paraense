import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/components/home/home_appbar.dart';
import 'package:jogo_cultura_paraense/components/home/home_scaffold.dart';
import 'package:jogo_cultura_paraense/components/locked_game_alert.dart';
import 'package:jogo_cultura_paraense/pages/games/art_fauna_flora.dart';
import 'package:jogo_cultura_paraense/pages/select_mini_game_page.dart';

class LevelSelectionPage extends StatelessWidget {
  static const String routeName = '/levelSelect';
  final GameObject gameObject;

  const LevelSelectionPage({Key key, this.gameObject}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      appBar: HomeAppBar(),
      body: LevelSelectionMenu(
        gameObject: gameObject,
      ),
    );
  }
}

class LevelSelectionMenu extends StatelessWidget {
  final GameObject gameObject;
  LevelSelectionMenu({Key key, this.gameObject}) : super(key: key);

  List<Widget> _buildList(BuildContext context) {
    return <Widget>[
      SelectLevelCard(
          level: 1,
          unlocked: true,
          onTap: () => _selectGame(context, gameObject.name)),
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
    ];
  }

  @override
  Widget build(BuildContext context) {
    final list = _buildList(context);

    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 100.0, bottom: 20.0),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 5.0),
            padding: EdgeInsets.symmetric(vertical: 5.0),
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            alignment: Alignment.center,
            child: Text(
              gameObject.name,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(
                      'Escolha uma dificuldade',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: list.length,
                    itemBuilder: (BuildContext context, int index) {
                      return list[index];
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _selectGame(BuildContext context, String gameName) {
    if (gameName == "FLORA/FAUNA/ARTESANATO") {
      Navigator.of(context).pushNamed(ArtFaunaFloraGamePage.routeName);
    }
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