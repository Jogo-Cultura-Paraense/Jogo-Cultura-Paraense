import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/components/level_selection/level_selection_card.dart';
import 'package:jogo_cultura_paraense/components/level_selection/level_selection_page.dart';
import 'package:jogo_cultura_paraense/games/cooking_game/cooking_game_rules.dart';
import 'package:jogo_cultura_paraense/model/game.dart';
import 'package:jogo_cultura_paraense/pages/games/game_pages.dart';

class CookingLevelSelectionPage extends StatelessWidget {
  static const String routeName = '/cooking_selection_level';
  const CookingLevelSelectionPage({Key key}) : super(key: key);

  List<LevelSelectionCard> _buildList(BuildContext context) {
    return <LevelSelectionCard>[
      LevelSelectionCard(
        level: 1,
        unlocked: true,
        onTap: () {
          Navigator.of(context).pushNamed(
            CookingGamePage.routeName,
            arguments: CookingGamePageArgs.fromRules(CookingGameRules1()),
          );
        },
      ),
      LevelSelectionCard(
        level: 2,
        unlocked: true,
        onTap: () {},
      ),
      LevelSelectionCard(
        level: 3,
        unlocked: true,
        onTap: () {},
      ),
      LevelSelectionCard(
        level: 4,
        unlocked: true,
        onTap: () {},
      ),
      LevelSelectionCard(
        level: 5,
        unlocked: true,
        onTap: () {},
      ),
      LevelSelectionCard(
        level: 6,
        unlocked: true,
        onTap: () {},
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final levels = _buildList(context);
    return LevelSelectionPage(gameName: Games.cooking, levels: levels);
  }
}
