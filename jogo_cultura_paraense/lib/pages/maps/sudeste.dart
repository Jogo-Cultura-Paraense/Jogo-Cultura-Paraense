import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/components/map/map_page.dart';
import 'package:jogo_cultura_paraense/components/map/region_page.dart';
import 'package:jogo_cultura_paraense/model/map.dart';

class SudestePage extends RegionPage {
  static const String routeName = '/sudeste';
  const SudestePage({Key key}) : super(gameMap: Maps.sudeste, key: key);

  @override
  List<GamePosition> getGamesPositions() {
    return <GamePosition>[
      GamePosition(top: 489.8, left: 150.5),
      GamePosition(top: 421, left: 93),
      GamePosition(top: 345.6, left: 134.7),
      GamePosition(top: 250, left: 90),
      GamePosition(top: 179, left: 154),
      GamePosition(top: 121, left: 76),
    ];
  }
}
