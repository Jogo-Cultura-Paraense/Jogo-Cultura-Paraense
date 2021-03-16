import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/components/home/home_appbar.dart';
import 'package:jogo_cultura_paraense/components/home/home_scaffold.dart';
import 'package:jogo_cultura_paraense/pages/select_level_page.dart';

class GameSelectionPage extends StatelessWidget {
  static const String routeName = '/gameSelect';

  const GameSelectionPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      appBar: HomeAppBar(),
      body: const GameSelectionMenu(),
    );
  }
}

class GameSelectionMenu extends StatelessWidget {
  const GameSelectionMenu({Key key}) : super(key: key);

  List<Widget> _buildList(BuildContext context) {
    return <Widget>[
      SelectCard(
        title: 'CULINÁRIA',
        onTap: () => _gotoLevel(
          context,
          new GameObject("CULINÁRIA", 1),
        ),
      ),
      SelectCard(
        title: 'ARQUITETURA/\nFESTIVIDADES',
        onTap: () => _gotoLevel(
          context,
          new GameObject("ARQUITETURA/\nFESTIVIDADES", 2),
        ),
      ),
      SelectCard(
        title: 'FLORA/FAUNA/ARTESANATO',
        onTap: () => _gotoLevel(
          context,
          new GameObject("FLORA/FAUNA/ARTESANATO", 3),
        ),
      ),
      SelectCard(
        title: 'LENDAS E MITOS',
        onTap: () => _gotoLevel(
          context,
          new GameObject("LENDAS E MITOS", 4),
        ),
      ),
      SelectCard(
        title: 'VOCABULÁRIO',
        onTap: () => _gotoLevel(
          context,
          new GameObject("VOCABULÁRIO", 5),
        ),
      ),
      SelectCard(
        title: 'MÚSICAS',
        onTap: () => _gotoLevel(
          context,
          new GameObject("MÚSICAS", 6),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final list = _buildList(context);

    return Container(
      padding: EdgeInsets.only(top: 100, bottom: 20),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
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
              'Escolha um Mini-jogo',
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
              child: GridView.count(
                primary: false,
                padding: EdgeInsets.all(10.0),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: list,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _gotoLevel(BuildContext context, GameObject gameObject) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => LevelSelectionPage(gameObject: gameObject),
      ),
    );
  }
}

class GameObject {
  final String name;
  final int unlockedLevel;

  GameObject(this.name, this.unlockedLevel);
}

class SelectCard extends StatelessWidget {
  const SelectCard({Key key, this.title, this.onTap}) : super(key: key);
  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () => onTap(),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    title,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
