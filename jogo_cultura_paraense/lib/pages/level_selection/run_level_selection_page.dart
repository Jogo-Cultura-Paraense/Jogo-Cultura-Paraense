import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/components/level_selection/level_selection_card.dart';
import 'package:jogo_cultura_paraense/components/level_selection/level_selection_page.dart';
import 'package:jogo_cultura_paraense/games/running_game/models/rules.dart';
import 'package:jogo_cultura_paraense/model/game.dart';
import 'package:jogo_cultura_paraense/pages/games/running_game_page.dart';

class RunningLevelSelectionPage extends StatelessWidget {
  static const String routeName = '/running_selection_level';
  const RunningLevelSelectionPage({Key key}) : super(key: key);

  List<LevelSelectionCard> _buildList(BuildContext context) {
    return <LevelSelectionCard>[
      LevelSelectionCard(
        level: 1,
        unlocked: true,
        onTap: () {
          Navigator.of(context).pushNamed(
            RunningGamePage.routeName,
            arguments: RunningGameRulebook.level1,
          );
        },
      ),
      LevelSelectionCard(
        level: 2,
        unlocked: true,
        onTap: () {
          Navigator.of(context).pushNamed(
            RunningGamePage.routeName,
            arguments: RunningGameRulebook.level2,
          );
        },
      ),
      LevelSelectionCard(
        level: 3,
        unlocked: true,
        onTap: () {
          Navigator.of(context).pushNamed(
            RunningGamePage.routeName,
            arguments: RunningGameRulebook.level3,
          );
        },
      ),
      LevelSelectionCard(
        level: 4,
        unlocked: true,
        onTap: () {
          Navigator.of(context).pushNamed(
            RunningGamePage.routeName,
            arguments: RunningGameRulebook.level4,
          );
        },
      ),
      LevelSelectionCard(
        level: 5,
        unlocked: true,
        onTap: () {
          Navigator.of(context).pushNamed(
            RunningGamePage.routeName,
            arguments: RunningGameRulebook.level5,
          );
        },
      ),
      LevelSelectionCard(
        level: 6,
        unlocked: true,
        onTap: () {
          Navigator.of(context).pushNamed(
            RunningGamePage.routeName,
            arguments: RunningGameRulebook.level6,
          );
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final levels = _buildList(context);
    return LevelSelectionPage(gameName: Games.legendAndMyths, levels: levels);
  }
}
