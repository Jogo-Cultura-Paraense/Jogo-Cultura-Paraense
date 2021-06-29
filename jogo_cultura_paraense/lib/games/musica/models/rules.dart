import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/model/map.dart';

class MusicGameRules {
  final String map;
  final double startTime;
  final double timeBetweenDiscs;
  final int level;

  const MusicGameRules(
      {@required this.timeBetweenDiscs,
      @required this.map,
      @required this.startTime,
      @required this.level});
}

abstract class MusicGameRulebook {
  static MusicGameRules get level1 => MusicGameRules(
        map: Maps.sudoeste.region,
        startTime: 60,
        timeBetweenDiscs: 1,
        level: 1,
      );

  static MusicGameRules get level2 => MusicGameRules(
        map: Maps.sudoeste.region,
        startTime: 60,
        timeBetweenDiscs: 1,
        level: 2,
      );

  static MusicGameRules get level3 => MusicGameRules(
        map: Maps.baixoAmazonas.region,
        startTime: 90,
        timeBetweenDiscs: 0.9,
        level: 3,
      );

  static MusicGameRules get level4 => MusicGameRules(
        map: Maps.sudeste.region,
        startTime: 90,
        timeBetweenDiscs: 0.6,
        level: 4,
      );

  static MusicGameRules get level5 => MusicGameRules(
        map: Maps.marajo.region,
        startTime: 120,
        timeBetweenDiscs: 0.8,
        level: 5,
      );

  static MusicGameRules get level6 => MusicGameRules(
        map: Maps.metropolitana.region,
        startTime: 120,
        timeBetweenDiscs: 0.5,
        level: 6,
      );

  static List<MusicGameRules> get all => [
        MusicGameRulebook.level1,
        MusicGameRulebook.level2,
        MusicGameRulebook.level3,
        MusicGameRulebook.level4,
        MusicGameRulebook.level5,
        MusicGameRulebook.level6,
      ];
}
