import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/components/home/buttons_top.dart';
import 'package:jogo_cultura_paraense/pages/select_level.dart';

class GameSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MenuAppBar(
      bodyWidget: GameSelectionMenu(),
    );
  }
}

class GameSelectionMenu extends StatelessWidget {
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
                    'Escolha um Mini-jogo',
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
              height: 520.0,
              child: Card(
                color: Colors.redAccent[700],
                child: SizedBox(
                  width: 200.0,
                  height: 200.0,
                  child: CustomScrollView(
                    primary: false,
                    slivers: <Widget>[
                      SliverPadding(
                        padding: const EdgeInsets.all(20),
                        sliver: SliverGrid.count(
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          crossAxisCount: 2,
                          children: <Widget>[
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _gotoLevel(BuildContext context, GameObject gameObject) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => LevelSelection(gameObject: gameObject),
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
