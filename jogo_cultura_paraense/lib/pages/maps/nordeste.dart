import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/components/map/map_page.dart';
import 'package:jogo_cultura_paraense/components/map/region_page.dart';
import 'package:jogo_cultura_paraense/model/map_save.dart';

class NordestePage extends RegionPage {
  static const String routeName = '/nordeste';
  const NordestePage({Key key}) : super(region: Maps.nordeste, key: key);

  @override
  List<GamePosition> getGamesPositions() {
    return <GamePosition>[
      GamePosition(top: 431, left: 181),
      GamePosition(top: 379.5, left: 85.3),
      GamePosition(top: 323.5, left: 222),
      GamePosition(top: 258, left: 76.5),
      GamePosition(top: 206, left: 202.7),
      GamePosition(top: 110.5, left: 150.7),
    ];
  }
}
