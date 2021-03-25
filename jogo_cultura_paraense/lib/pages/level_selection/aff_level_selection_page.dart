import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/components/level_selection/level_selection_card.dart';
import 'package:jogo_cultura_paraense/components/level_selection/level_selection_page.dart';
import 'package:jogo_cultura_paraense/model/game_save.dart';
import 'package:jogo_cultura_paraense/model/map.dart';
import 'package:jogo_cultura_paraense/pages/games/art_fauna_flora_page.dart';

class AFFLevelSelectionPage extends StatelessWidget {
  static const String routeName = 'aff_selection_level';
  const AFFLevelSelectionPage({Key key}) : super(key: key);

  List<LevelSelectionCard> _buildList(BuildContext context) {
    return <LevelSelectionCard>[
      LevelSelectionCard(
        level: 1,
        unlocked: true,
        onTap: () {
          Navigator.of(context).pushNamed(
            ArtFaunaFloraGamePage.routeName,
            arguments: ArtFaunaFloraGamePageArgs(
              map: Maps.sudoeste.region,
              numTargets: 4,
              startTime: 5,
              timeCorrectTile: 2,
              timeIncorrectTile: -1,
              spritesRange: 13,
            ),
          );
        },
      ),
      LevelSelectionCard(
        level: 2,
        unlocked: true,
        onTap: () => () {
          Navigator.of(context).pushNamed(
            ArtFaunaFloraGamePage.routeName,
            arguments: ArtFaunaFloraGamePageArgs(
              map: Maps.sudoeste.region,
              numTargets: 6,
              startTime: 5,
              timeCorrectTile: 2,
              timeIncorrectTile: -1,
              spritesRange: 13,
            ),
          );
        },
      ),
      LevelSelectionCard(
        level: 3,
        unlocked: true,
        onTap: () => () {
          Navigator.of(context).pushNamed(
            ArtFaunaFloraGamePage.routeName,
            arguments: ArtFaunaFloraGamePageArgs(
              map: Maps.baixoAmazonas.region,
              numTargets: 4,
              startTime: 4.5,
              timeCorrectTile: 1.5,
              timeIncorrectTile: -0.75,
              spritesRange: 17,
            ),
          );
        },
      ),
      LevelSelectionCard(
        level: 4,
        unlocked: true,
        onTap: () => () {
          Navigator.of(context).pushNamed(
            ArtFaunaFloraGamePage.routeName,
            arguments: ArtFaunaFloraGamePageArgs(
              map: Maps.sudeste.region,
              numTargets: 6,
              startTime: 4.5,
              timeCorrectTile: 1.5,
              timeIncorrectTile: -0.75,
              spritesRange: 17,
            ),
          );
        },
      ),
      LevelSelectionCard(
        level: 5,
        unlocked: true,
        onTap: () => () {
          Navigator.of(context).pushNamed(
            ArtFaunaFloraGamePage.routeName,
            arguments: ArtFaunaFloraGamePageArgs(
              map: Maps.marajo.region,
              numTargets: 4,
              startTime: 4,
              timeCorrectTile: 1,
              timeIncorrectTile: -0.5,
              spritesRange: 24,
            ),
          );
        },
      ),
      LevelSelectionCard(
        level: 6,
        unlocked: true,
        onTap: () => () {
          Navigator.of(context).pushNamed(
            ArtFaunaFloraGamePage.routeName,
            arguments: ArtFaunaFloraGamePageArgs(
              map: Maps.metropolitana.region,
              numTargets: 6,
              startTime: 4,
              timeCorrectTile: 1,
              timeIncorrectTile: -0.5,
              spritesRange: 24,
            ),
          );
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final levels = _buildList(context);
    return LevelSelectionPage(gameName: Games.faunaAndFlora, levels: levels);
  }
}
