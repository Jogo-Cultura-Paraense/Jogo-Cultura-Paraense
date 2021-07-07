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
import 'package:jogo_cultura_paraense/pages/games/art_fauna_flora_page.dart';
import 'package:jogo_cultura_paraense/pages/games/cooking_game_page.dart';
import 'package:jogo_cultura_paraense/pages/games/musica_page.dart';
import 'package:jogo_cultura_paraense/pages/games/running_game_page.dart';
import 'package:jogo_cultura_paraense/games/arq_fest/tutorial_arq_fest.dart';

class SudoestePage extends RegionPage {
  static const String routeName = '/sudoeste';
  const SudoestePage({Key key}) : super(gameMap: Maps.sudoeste, key: key);

  @override
  List<GamePosition> getGamesPositions() {
    return <GamePosition>[
      GamePosition(
        top: 575,
        left: 110,
        routeName: CookingGamePage.routeName,
        routeArgs: CookingGameRulebook.level1,
      ),
      GamePosition(
        top: 475,
        left: 155,
        routeName: TutorialArqFestScreen.routeName,
        routeArgs: 1,
      ),
      GamePosition(
        top: 360,
        left: 140,
        routeName: ArtFaunaFloraGamePage.routeName,
        routeArgs: ArtFaunaFloraGameRulebook.level1,
      ),
      GamePosition(
        top: 265,
        left: 100,
        routeName: RunningGamePage.routeName,
        routeArgs: RunningGameRulebook.level1,
      ),
      GamePosition(
        top: 185,
        left: 180,
        routeName: MainVocabularioScreen.routeName,
      ),
      GamePosition(
        top: 130,
        left: 275,
        routeName: MusicGamePage.routeName,
        routeArgs: MusicGameRulebook.level1,
      ),
    ];
  }
}
