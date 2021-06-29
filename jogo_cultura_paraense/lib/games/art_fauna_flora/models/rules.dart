import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/model/map.dart';

class ArtFaunaFloraGameRules {
  final String map;
  final int numTargets;
  final double startTime;
  final double timeCorrectTile;
  final double timeIncorrectTile;
  final int spritesRange;

  const ArtFaunaFloraGameRules({
    @required this.map,
    @required this.numTargets,
    @required this.startTime,
    @required this.timeCorrectTile,
    @required this.timeIncorrectTile,
    @required this.spritesRange,
  });
}

abstract class ArtFaunaFloraGameRulebook {
  static ArtFaunaFloraGameRules get level1 => ArtFaunaFloraGameRules(
        map: Maps.sudoeste.region,
        numTargets: 4,
        startTime: 5,
        timeCorrectTile: 2,
        timeIncorrectTile: -1,
        spritesRange: 13,
      );

  static ArtFaunaFloraGameRules get level2 => ArtFaunaFloraGameRules(
        map: Maps.sudoeste.region,
        numTargets: 6,
        startTime: 5,
        timeCorrectTile: 2,
        timeIncorrectTile: -1,
        spritesRange: 13,
      );

  static ArtFaunaFloraGameRules get level3 => ArtFaunaFloraGameRules(
        map: Maps.baixoAmazonas.region,
        numTargets: 4,
        startTime: 4.5,
        timeCorrectTile: 1.5,
        timeIncorrectTile: -0.75,
        spritesRange: 17,
      );

  static ArtFaunaFloraGameRules get level4 => ArtFaunaFloraGameRules(
        map: Maps.sudeste.region,
        numTargets: 6,
        startTime: 4.5,
        timeCorrectTile: 1.5,
        timeIncorrectTile: -0.75,
        spritesRange: 17,
      );

  static ArtFaunaFloraGameRules get level5 => ArtFaunaFloraGameRules(
        map: Maps.marajo.region,
        numTargets: 4,
        startTime: 4,
        timeCorrectTile: 1,
        timeIncorrectTile: -0.5,
        spritesRange: 24,
      );

  static ArtFaunaFloraGameRules get level6 => ArtFaunaFloraGameRules(
        map: Maps.metropolitana.region,
        numTargets: 6,
        startTime: 4,
        timeCorrectTile: 1,
        timeIncorrectTile: -0.5,
        spritesRange: 24,
      );

  static List<ArtFaunaFloraGameRules> get all => [
        ArtFaunaFloraGameRulebook.level1,
        ArtFaunaFloraGameRulebook.level2,
        ArtFaunaFloraGameRulebook.level3,
        ArtFaunaFloraGameRulebook.level4,
        ArtFaunaFloraGameRulebook.level5,
        ArtFaunaFloraGameRulebook.level6,
      ];
}
