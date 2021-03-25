import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/components/map/map_page.dart';
import 'package:jogo_cultura_paraense/components/map/region_page.dart';
import 'package:jogo_cultura_paraense/model/map.dart';

class BaixoAmazonasPage extends RegionPage {
  static const String routeName = '/baixo_amazonas';
  const BaixoAmazonasPage({Key key})
      : super(gameMap: Maps.baixoAmazonas, key: key);

  @override
  List<GamePosition> getGamesPositions() {
    return <GamePosition>[
      GamePosition(top: 485.2, left: 208.3),
      GamePosition(top: 400.5, left: 140.5),
      GamePosition(top: 327, left: 74.7),
      GamePosition(top: 203, left: 43),
      GamePosition(top: 127, left: 122.7),
      GamePosition(top: 93.5, left: 224.5),
    ];
  }
}
