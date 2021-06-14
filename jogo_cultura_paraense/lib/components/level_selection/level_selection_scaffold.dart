import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/components/home/home_appbar.dart';
import 'package:jogo_cultura_paraense/components/home/home_scaffold.dart';
import 'package:jogo_cultura_paraense/components/level_selection/level_selection_box.dart';
import 'package:jogo_cultura_paraense/components/level_selection/level_selection_card.dart';

class LevelSelectionScaffold extends StatelessWidget {
  final String gameName;
  const LevelSelectionScaffold({@required this.gameName, Key key})
      : super(key: key);

  List<LevelSelectionCard> buildCards(BuildContext context) {
    return <LevelSelectionCard>[];
  }

  @override
  Widget build(BuildContext context) {
    final List<LevelSelectionCard> levels = buildCards(context);

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
                gameName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Expanded(child: LevelSelectionBox(levels)),
          ],
        ),
      ),
    );
  }
}
