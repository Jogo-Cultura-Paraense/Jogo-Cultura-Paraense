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

class MetropolitanaPage extends RegionPage {
  static const String routeName = '/metropolitana';
  const MetropolitanaPage({Key key})
      : super(gameMap: Maps.metropolitana, key: key);

  @override
  List<GamePosition> getGamesPositions() {
    return <GamePosition>[
      GamePosition(
        top: 485.2,
        left: 155.7,
        routeName: CookingGamePage.routeName,
        routeArgs: CookingGameRulebook.level6,
      ),
      GamePosition(
        top: 376,
        left: 111.5,
        routeName: SelectArqFest.routeName,
        routeArgs: 6,
      ),
      GamePosition(
        top: 257.5,
        left: 105,
        routeName: ArtFaunaFloraGamePage.routeName,
        routeArgs: ArtFaunaFloraGameRulebook.level6,
      ),
      GamePosition(
        top: 143.5,
        left: 65.5,
        routeName: RunningGamePage.routeName,
        routeArgs: RunningGameRulebook.level6,
      ),
      GamePosition(
        top: 172,
        left: 231,
        routeName: MainVocabularioScreen.routeName,
      ),
      GamePosition(
        top: 60,
        left: 187,
        routeName: MusicGamePage.routeName,
        routeArgs: MusicGameRulebook.level6,
      ),
    ];
  }
}
