import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/components/map/map_page.dart';
import 'package:jogo_cultura_paraense/components/map/region_page.dart';
import 'package:jogo_cultura_paraense/model/map_save.dart';

class MetropolitanaPage extends RegionPage {
  static const String routeName = '/metropolitana';
  const MetropolitanaPage({Key key})
      : super(region: Maps.metropolitana, key: key);

  @override
  List<GamePosition> getGamesPositions() {
    return <GamePosition>[
      GamePosition(top: 476.2, left: 155.7),
      GamePosition(top: 376, left: 111.5),
      GamePosition(top: 257.5, left: 105),
      GamePosition(top: 143.5, left: 65.5),
      GamePosition(top: 172, left: 231),
      GamePosition(top: 60, left: 187),
    ];
  }
}
