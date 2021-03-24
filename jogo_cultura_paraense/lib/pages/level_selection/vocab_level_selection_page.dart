import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/components/level_selection/level_selection_card.dart';
import 'package:jogo_cultura_paraense/components/level_selection/level_selection_page.dart';
import 'package:jogo_cultura_paraense/games/vocabulario/main_vocabulario.dart';
import 'package:jogo_cultura_paraense/model/game_save.dart';

class VocabLevelSelectionPage extends StatelessWidget {
  static const String routeName = 'vocab_selection_level';
  const VocabLevelSelectionPage({Key key}) : super(key: key);

  List<LevelSelectionCard> _buildList(BuildContext context) {
    return <LevelSelectionCard>[
      LevelSelectionCard(
        level: 1,
        unlocked: true,
        onTap: () {
          Navigator.of(context).pushNamed(MainVocabularioScreen.routeName);
        },
      ),
      LevelSelectionCard(
        level: 2,
        unlocked: true,
        onTap: () {
          Navigator.of(context).pushNamed(MainVocabularioScreen.routeName);
        },
      ),
      LevelSelectionCard(
        level: 3,
        unlocked: true,
        onTap: () {
          Navigator.of(context).pushNamed(MainVocabularioScreen.routeName);
        },
      ),
      LevelSelectionCard(
        level: 4,
        unlocked: true,
        onTap: () {
          Navigator.of(context).pushNamed(MainVocabularioScreen.routeName);
        },
      ),
      LevelSelectionCard(
        level: 5,
        unlocked: true,
        onTap: () {
          Navigator.of(context).pushNamed(MainVocabularioScreen.routeName);
        },
      ),
      LevelSelectionCard(
        level: 6,
        unlocked: true,
        onTap: () {
          Navigator.of(context).pushNamed(MainVocabularioScreen.routeName);
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final levels = _buildList(context);
    return LevelSelectionPage(gameName: Games.vocabulary, levels: levels);
  }
}
