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

class BaixoAmazonasPage extends RegionPage {
  static const String routeName = '/baixo_amazonas';
  const BaixoAmazonasPage({Key key})
      : super(gameMap: Maps.baixoAmazonas, key: key);

  @override
  List<GamePosition> getGamesPositions() {
    List<GamePosition> games = [
      GamePosition(
        top: 485.2,
        left: 208.3,
        routeName: CookingGamePage.routeName,
        routeArgs: CookingGameRulebook.level2,
      ),
      GamePosition(
        top: 400.5,
        left: 140.5,
        routeName: SelectArqFest.routeName,
        routeArgs: 2,
      ),
      GamePosition(
        top: 327,
        left: 74.7,
        routeName: ArtFaunaFloraGamePage.routeName,
        routeArgs: ArtFaunaFloraGameRulebook.level2,
      ),
      GamePosition(
        top: 203,
        left: 43,
        routeName: RunningGamePage.routeName,
        routeArgs: RunningGameRulebook.level2,
      ),
      GamePosition(
        top: 127,
        left: 122.7,
        routeName: MainVocabularioScreen.routeName,
      ),
      GamePosition(
        top: 93.5,
        left: 224.5,
        routeName: MusicGamePage.routeName,
        routeArgs: MusicGameRulebook.level2,
      ),
    ];

    return games;
  }
}
