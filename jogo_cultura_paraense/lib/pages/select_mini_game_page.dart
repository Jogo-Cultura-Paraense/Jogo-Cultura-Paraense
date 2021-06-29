import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/components/home/home_appbar.dart';
import 'package:jogo_cultura_paraense/components/home/home_scaffold.dart';
import 'package:jogo_cultura_paraense/pages/level_selection/arq_fest_selection_page.dart';
import 'package:jogo_cultura_paraense/pages/level_selection/level_selection_pages.dart';
import 'package:jogo_cultura_paraense/pages/level_selection/run_level_selection_page.dart';
import 'package:jogo_cultura_paraense/pages/level_selection/music_level_page.dart';

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
        imageLink: 'assets/images/selection/SelecaoCulinaria.png',
        onTap: () {
          Navigator.of(context).pushNamed(CookingLevelSelectionPage.routeName);
        },
      ),
      SelectCard(
        title: 'ARQUITETURA/\nFESTIVIDADES',
        imageLink: 'assets/images/selection/SelecaoArqFest.png',
        onTap: () {
          Navigator.of(context).pushNamed(ArqFestSelectionPage.routeName);
        },
      ),
      SelectCard(
        title: 'FLORA/FAUNA/ARTESANATO',
        imageLink: 'assets/images/selection/SelecaoFaunaFlora.png',
        onTap: () => Navigator.of(context)
            .pushNamed(ArtFaunaFloraLevelSelectionPage.routeName),
      ),
      SelectCard(
        title: 'LENDAS E MITOS',
        imageLink: 'assets/images/selection/SelecaoRunning.png',
        onTap: () => Navigator.of(context)
            .pushNamed(RunningLevelSelectionPage.routeName),
      ),
      SelectCard(
        title: 'VOCABULÁRIO',
        imageLink: 'assets/images/selection/SelecaoVocab.png',
        onTap: () =>
            Navigator.of(context).pushNamed(VocabLevelSelectionPage.routeName),
      ),
      SelectCard(
        title: 'MÚSICAS',
        imageLink: 'assets/images/selection/SelecaoRitmos.png',
        onTap: () =>
            Navigator.of(context).pushNamed(MusicLevelSelectionPage.routeName),
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
  const SelectCard({Key key, this.title, this.imageLink, this.onTap})
      : super(key: key);
  final String title;
  final String imageLink;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
          color: Colors.transparent,
          child: Stack(
            children: [
              Center(
                  child: Ink.image(
                image: AssetImage(imageLink),
                fit: BoxFit.cover,
              )),
              Container(
                color: Colors.white24,
              ),
              InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () => onTap(),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Stack(
                            children: <Widget>[
                              Text(
                                title,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  foreground: Paint()
                                    ..style = PaintingStyle.stroke
                                    ..strokeWidth = 4
                                    ..color = Colors.black,
                                ),
                              ),
                              Text(
                                title,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
