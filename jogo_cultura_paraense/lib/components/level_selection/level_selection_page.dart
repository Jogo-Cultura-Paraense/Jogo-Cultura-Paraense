import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/components/home/home_appbar.dart';
import 'package:jogo_cultura_paraense/components/home/home_scaffold.dart';
import 'package:jogo_cultura_paraense/components/level_selection/level_selection_card.dart';

class LevelSelectionPage extends StatelessWidget {
  final String _gameName;
  final List<LevelSelectionCard> _levels;
  const LevelSelectionPage(
      {@required String gameName, @required List<Widget> levels, Key key})
      : _gameName = gameName,
        _levels = levels,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      appBar: HomeAppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 100.0, bottom: 20.0),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 5.0),
              padding: EdgeInsets.symmetric(vertical: 5.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Text(
                _gameName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
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
                  mainAxisSize: MainAxisSize.max,
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
                      itemCount: _levels.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _levels[index];
                      },
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
}
