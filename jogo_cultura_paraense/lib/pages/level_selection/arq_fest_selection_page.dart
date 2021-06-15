import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/components/level_selection/level_selection_card.dart';
import 'package:jogo_cultura_paraense/components/level_selection/level_selection_page.dart';
import 'package:jogo_cultura_paraense/games/arq_fest/select_arq_fest.dart';
import 'package:jogo_cultura_paraense/model/game.dart';

class ArqFestSelectionPage extends StatelessWidget {
  static const String routeName = 'arq_fest_selection_level';
  const ArqFestSelectionPage({Key key}) : super(key: key);

  List<LevelSelectionCard> _buildList(BuildContext context) {
    return <LevelSelectionCard>[
      LevelSelectionCard(
        level: 1,
        unlocked: true,
        onTap: () {
          Navigator.of(context).pushNamed(SelectArqFest.routeName, arguments: 1);
        },
      ),
      LevelSelectionCard(
        level: 2,
        unlocked: true,
        onTap: () {
          Navigator.of(context).pushNamed(SelectArqFest.routeName, arguments: 2);
        },
      ),
      LevelSelectionCard(
        level: 3,
        unlocked: true,
        onTap: () {
          Navigator.of(context).pushNamed(SelectArqFest.routeName, arguments: 3);
        },
      ),
      LevelSelectionCard(
        level: 4,
        unlocked: true,
        onTap: () {
          Navigator.of(context).pushNamed(SelectArqFest.routeName, arguments: 4);
        },
      ),
      LevelSelectionCard(
        level: 5,
        unlocked: true,
        onTap: () {
          Navigator.of(context).pushNamed(SelectArqFest.routeName, arguments: 5);
        },
      ),
      LevelSelectionCard(
        level: 6,
        unlocked: true,
        onTap: () {
          Navigator.of(context).pushNamed(SelectArqFest.routeName, arguments: 6);
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final levels = _buildList(context);
    return LevelSelectionPage(gameName: Games.archAndFestiv, levels: levels);
  }
}
