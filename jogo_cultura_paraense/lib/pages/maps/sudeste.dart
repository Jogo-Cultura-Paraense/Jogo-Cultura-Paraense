import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/components/map/map_page.dart';
import 'package:jogo_cultura_paraense/components/map/region_page.dart';
import 'package:jogo_cultura_paraense/games/arq_fest/select_arq_fest.dart';
import 'package:jogo_cultura_paraense/games/art_fauna_flora/models/rules.dart';
import 'package:jogo_cultura_paraense/games/cooking_game/models/rules.dart';
import 'package:jogo_cultura_paraense/games/musica/models/rules.dart';
import 'package:jogo_cultura_paraense/games/running_game/models/rules.dart';
import 'package:jogo_cultura_paraense/games/vocabulario/main_vocabulario.dart';
import 'package:jogo_cultura_paraense/model/map.dart';
import 'package:jogo_cultura_paraense/pages/games/cooking_game_page.dart';
import 'package:jogo_cultura_paraense/pages/games/game_pages.dart';
import 'package:jogo_cultura_paraense/pages/games/musica_page.dart';
import 'package:jogo_cultura_paraense/games/arq_fest/tutorial_arq_fest.dart';

class SudestePage extends RegionPage {
  static const String routeName = '/sudeste';
  const SudestePage({Key key}) : super(gameMap: Maps.sudeste, key: key);

  @override
  List<GamePosition> getGamesPositions() {
    List<GamePosition> games = [
      GamePosition(
        top: 489.8,
        left: 150.5,
        routeName: CookingGamePage.routeName,
        routeArgs: CookingGameRulebook.level3,
      ),
      GamePosition(
        top: 421,
        left: 93,
        routeName: TutorialArqFestScreen.routeName,
        routeArgs: 3,
      ),
      GamePosition(
        top: 345.6,
        left: 134.7,
        routeName: ArtFaunaFloraGamePage.routeName,
        routeArgs: ArtFaunaFloraGameRulebook.level3,
      ),
      GamePosition(
        top: 250,
        left: 90,
        routeName: RunningGamePage.routeName,
        routeArgs: RunningGameRulebook.level3,
      ),
      GamePosition(
        top: 179,
        left: 154,
        routeName: MainVocabularioScreen.routeName,
      ),
      GamePosition(
        top: 121,
        left: 76,
        routeName: MusicGamePage.routeName,
        routeArgs: MusicGameRulebook.level3,
      ),
    ];

    return games;
  }
}
