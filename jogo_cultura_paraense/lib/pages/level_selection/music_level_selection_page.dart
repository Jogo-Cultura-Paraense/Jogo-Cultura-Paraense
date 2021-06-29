import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jogo_cultura_paraense/bloc/save/save_bloc.dart';
import 'package:jogo_cultura_paraense/components/level_selection/level_selection_card.dart';
import 'package:jogo_cultura_paraense/components/level_selection/level_selection_scaffold.dart';
import 'package:jogo_cultura_paraense/games/musica/models/rules.dart';
import 'package:jogo_cultura_paraense/model/game.dart';
import 'package:jogo_cultura_paraense/model/game_save.dart';
import 'package:jogo_cultura_paraense/model/map.dart';
import 'package:jogo_cultura_paraense/model/map_save.dart';
import 'package:jogo_cultura_paraense/model/save.dart';
import 'package:jogo_cultura_paraense/pages/games/musica_page.dart';

class MusicLevelSelectionPage extends LevelSelectionScaffold {
  static const String routeName = '/music_selection_level';
  const MusicLevelSelectionPage({Key key})
      : super(gameName: Games.music, key: key);

  @override
  List<LevelSelectionCard> buildCards(BuildContext context) {
    final List<LevelSelectionCard> levels = [];
    final Save save = BlocProvider.of<SaveBloc>(context).state.currentSave;
    final List<GameMap> allMaps = Maps.all;
    final List<MusicGameRules> rules = MusicGameRulebook.all;
    MapSave map;
    GameSave game;
    bool unlocked;
    VoidCallback callback;
    for (int i = 0; i < allMaps.length; i += 1) {
      map = save.getMapSave(allMaps[i].region);
      game = map.getGameSave(gameName);
      unlocked = false;
      callback = () {};
      if (map.isOpen && game.isOpen) {
        unlocked = true;
        callback = () {
          Navigator.of(context).pushNamed(
            MusicGamePage.routeName,
            arguments: rules[i],
          );
        };
      }
      levels.add(
        LevelSelectionCard(
          level: i + 1,
          unlocked: unlocked,
          onTap: callback,
        ),
      );
    }

    return levels;
  }
}
