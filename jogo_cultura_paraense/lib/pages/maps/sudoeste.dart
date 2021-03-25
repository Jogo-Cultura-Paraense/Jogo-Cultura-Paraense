import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/components/map/map_page.dart';
import 'package:jogo_cultura_paraense/components/map/region_page.dart';
import 'package:jogo_cultura_paraense/model/map.dart';

class SudoestePage extends RegionPage {
  static const String routeName = '/sudoeste';
  const SudoestePage({Key key}) : super(gameMap: Maps.sudoeste, key: key);

  @override
  List<GamePosition> getGamesPositions() {
    return <GamePosition>[
      GamePosition(top: 492.5, left: 91),
      GamePosition(top: 408, left: 127),
      GamePosition(top: 311, left: 116.5),
      GamePosition(top: 229.5, left: 74),
      GamePosition(top: 162, left: 147),
      GamePosition(top: 114.5, left: 228.5),
    ];
  }
}
