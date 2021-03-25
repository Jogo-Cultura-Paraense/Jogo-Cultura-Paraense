import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/components/home/home_appbar.dart';
import 'package:jogo_cultura_paraense/components/home/home_scaffold.dart';
import 'package:jogo_cultura_paraense/pages/level_selection/level_selection_pages.dart';

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
        onTap: () {},
      ),
      SelectCard(
        title: 'ARQUITETURA/\nFESTIVIDADES',
        onTap: () {},
      ),
      SelectCard(
        title: 'FLORA/FAUNA/ARTESANATO',
        onTap: () =>
            Navigator.of(context).pushNamed(AFFLevelSelectionPage.routeName),
      ),
      SelectCard(
        title: 'LENDAS E MITOS',
        onTap: () {},
      ),
      SelectCard(
        title: 'VOCABULÁRIO',
        onTap: () =>
            Navigator.of(context).pushNamed(VocabLevelSelectionPage.routeName),
      ),
      SelectCard(
        title: 'MÚSICAS',
        onTap: () {},
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
