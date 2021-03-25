import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/components/map/map_page.dart';
import 'package:jogo_cultura_paraense/components/map/region_page.dart';
import 'package:jogo_cultura_paraense/model/map.dart';

class MarajoPage extends RegionPage {
  static const String routeName = '/marajo';
  const MarajoPage({Key key}) : super(gameMap: Maps.marajo, key: key);

  @override
  List<GamePosition> getGamesPositions() {
    return <GamePosition>[
      GamePosition(top: 476.5, left: 199),
      GamePosition(top: 396.5, left: 108),
      GamePosition(top: 319, left: 215.5),
      GamePosition(top: 212, left: 148.5),
      GamePosition(top: 122, left: 232.5),
      GamePosition(top: 110.5, left: 67),
    ];
  }
}
