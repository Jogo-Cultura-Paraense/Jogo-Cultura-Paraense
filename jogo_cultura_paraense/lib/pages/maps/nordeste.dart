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

class NordestePage extends RegionPage {
  static const String routeName = '/nordeste';
  const NordestePage({Key key}) : super(gameMap: Maps.nordeste, key: key);

  @override
  List<GamePosition> getGamesPositions() {
    return <GamePosition>[
      GamePosition(
        top: 431,
        left: 181,
        routeName: CookingGamePage.routeName,
        routeArgs: CookingGameRulebook.level4,
      ),
      GamePosition(
        top: 379.5,
        left: 85.3,
        routeName: SelectArqFest.routeName,
        routeArgs: 4,
      ),
      GamePosition(
        top: 323.5,
        left: 222,
        routeName: ArtFaunaFloraGamePage.routeName,
        routeArgs: ArtFaunaFloraGameRulebook.level4,
      ),
      GamePosition(
        top: 258,
        left: 76.5,
        routeName: RunningGamePage.routeName,
        routeArgs: RunningGameRulebook.level4,
      ),
      GamePosition(
        top: 206,
        left: 202.7,
        routeName: MainVocabularioScreen.routeName,
      ),
      GamePosition(
        top: 110.5,
        left: 150.7,
        routeName: MusicGamePage.routeName,
        routeArgs: MusicGameRulebook.level4,
      ),
    ];
  }
}
