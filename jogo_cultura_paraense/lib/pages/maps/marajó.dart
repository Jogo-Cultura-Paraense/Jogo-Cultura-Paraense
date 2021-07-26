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

class MarajoPage extends RegionPage {
  static const String routeName = '/marajo';
  const MarajoPage({Key key}) : super(gameMap: Maps.marajo, key: key);

  @override
  List<GamePosition> getGamesPositions() {
    return <GamePosition>[
      GamePosition(
        top: 476.5,
        left: 199,
        routeName: CookingGamePage.routeName,
        routeArgs: CookingGameRulebook.level5,
      ),
      GamePosition(
        top: 396.5,
        left: 108,
        routeName: SelectArqFest.routeName,
        routeArgs: 5,
      ),
      GamePosition(
        top: 319,
        left: 215.5,
        routeName: ArtFaunaFloraGamePage.routeName,
        routeArgs: ArtFaunaFloraGameRulebook.level5,
      ),
      GamePosition(
        top: 212,
        left: 148.5,
        routeName: RunningGamePage.routeName,
        routeArgs: RunningGameRulebook.level5,
      ),
      GamePosition(
        top: 122,
        left: 232.5,
        routeName: MainVocabularioScreen.routeName,
      ),
      GamePosition(
        top: 110.5,
        left: 67,
        routeName: MusicGamePage.routeName,
        routeArgs: MusicGameRulebook.level5,
      ),
    ];
  }
}
