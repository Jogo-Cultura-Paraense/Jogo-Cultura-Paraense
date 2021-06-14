import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/components/level_selection/level_selection_card.dart';
import 'package:jogo_cultura_paraense/components/level_selection/level_selection_page.dart';
import 'package:jogo_cultura_paraense/games/musica/components/bgm.dart';
import 'package:jogo_cultura_paraense/model/game.dart';
import 'package:jogo_cultura_paraense/model/map.dart';
import 'package:jogo_cultura_paraense/pages/games/musica_page.dart';

class MusicLevelSelectionPage extends StatelessWidget {
  static const String routeName = '/music_selection_level';
  const MusicLevelSelectionPage({Key key}) : super(key: key);

  List<LevelSelectionCard> _buildList(BuildContext context) {
    //BGM.removeAll(); //para a música, caso esteja tocando
    return <LevelSelectionCard>[
      LevelSelectionCard(
        level: 1,
        unlocked: true,
        onTap: () {
          Navigator.of(context).pushNamed(
            MusicGameGamePage.routeName,
            arguments: MusicGamePageArgs(
                map: Maps.sudoeste.region,
                startTime: 60,
                timeBetweenDiscs: 1,
                level: 1),
          );
        },
      ),
      LevelSelectionCard(
        level: 2,
        unlocked: true,
        onTap: () {
          Navigator.of(context).pushNamed(
            MusicGameGamePage.routeName,
            arguments: MusicGamePageArgs(
                map: Maps.sudoeste.region,
                startTime: 60,
                timeBetweenDiscs: 1,
                level: 2),
          );
        },
      ),
      LevelSelectionCard(
        level: 3,
        unlocked: true,
        onTap: () {
          Navigator.of(context).pushNamed(
            MusicGameGamePage.routeName,
            arguments: MusicGamePageArgs(
                map: Maps.baixoAmazonas.region,
                startTime: 90,
                timeBetweenDiscs: 0.9,
                level: 3),
          );
        },
      ),
      LevelSelectionCard(
        level: 4,
        unlocked: true,
        onTap: () {
          Navigator.of(context).pushNamed(
            MusicGameGamePage.routeName,
            arguments: MusicGamePageArgs(
                map: Maps.sudeste.region,
                startTime: 90,
                timeBetweenDiscs: 0.6,
                level: 4),
          );
        },
      ),
      LevelSelectionCard(
        level: 5,
        unlocked: true,
        onTap: () {
          Navigator.of(context).pushNamed(
            MusicGameGamePage.routeName,
            arguments: MusicGamePageArgs(
                map: Maps.marajo.region,
                startTime: 120,
                timeBetweenDiscs: 0.8,
                level: 5),
          );
        },
      ),
      LevelSelectionCard(
        level: 6,
        unlocked: true,
        onTap: () {
          Navigator.of(context).pushNamed(
            MusicGameGamePage.routeName,
            arguments: MusicGamePageArgs(
                map: Maps.metropolitana.region,
                startTime: 120,
                timeBetweenDiscs: 0.5,
                level: 6),
          );
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final levels = _buildList(context);
    return LevelSelectionPage(gameName: Games.music, levels: levels);
  }
}
