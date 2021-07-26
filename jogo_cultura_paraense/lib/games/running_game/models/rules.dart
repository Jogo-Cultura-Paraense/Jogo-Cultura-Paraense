import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/games/running_game/models/legend.dart';
import 'package:jogo_cultura_paraense/games/running_game/models/obstacle.dart';
import 'package:jogo_cultura_paraense/model/map.dart';

class RunningGameRules {
  final String levelName;
  final int level;
  final int time;
  final int hints;
  final int speed;
  final List<Legend> legends;
  final List<Obstacle> obstacles = ObstacleFactory.all;
  final List<String> newItems;

  RunningGameRules({
    @required this.level,
    @required this.time,
    @required this.legends,
    @required this.speed,
    @required this.newItems,
    String levelName,
    int hints,
  })  : this.hints = hints ?? level,
        this.levelName = levelName ?? level.toString();
}

abstract class RunningGameRulebook {
  static RunningGameRules get level1 => RunningGameRules(
        level: 1,
        levelName: Maps.sudoeste.region,
        time: 270,
        speed: 400,
        legends: [
          LegendFactory.boto,
          LegendFactory.cobraGrande,
          LegendFactory.curupira,
        ],
        newItems: ['id_boto', 'id_cobra_grande', 'id_curupira'],
      );

  static RunningGameRules get level2 => RunningGameRules(
        level: 2,
        levelName: Maps.baixoAmazonas.region,
        time: 240,
        speed: 440,
        legends: [
          LegendFactory.boto,
          LegendFactory.cobraGrande,
          LegendFactory.curupira,
          LegendFactory.iara,
        ],
        newItems: ['id_iara'],
      );

  static RunningGameRules get level3 => RunningGameRules(
        level: 3,
        levelName: Maps.sudeste.region,
        time: 210,
        speed: 480,
        legends: [
          LegendFactory.boto,
          LegendFactory.cobraGrande,
          LegendFactory.curupira,
          LegendFactory.iara,
          LegendFactory.mapinguari
        ],
        newItems: ['id_mapinguari'],
      );
  static RunningGameRules get level4 => RunningGameRules(
        level: 4,
        levelName: Maps.nordeste.region,
        time: 180,
        speed: 520,
        legends: [
          LegendFactory.boto,
          LegendFactory.cobraGrande,
          LegendFactory.curupira,
          LegendFactory.iara,
          LegendFactory.mapinguari,
          LegendFactory.matinta
        ],
        newItems: ['id_matinta'],
      );
  static RunningGameRules get level5 => RunningGameRules(
        level: 5,
        levelName: Maps.marajo.region,
        time: 150,
        speed: 560,
        legends: [
          LegendFactory.boto,
          LegendFactory.cobraGrande,
          LegendFactory.curupira,
          LegendFactory.iara,
          LegendFactory.mapinguari,
          LegendFactory.matinta,
          LegendFactory.muiraquita,
        ],
        newItems: ['id_muiraquita'],
      );
  static RunningGameRules get level6 => RunningGameRules(
        level: 6,
        levelName: Maps.metropolitana.region,
        time: 120,
        speed: 600,
        legends: [
          LegendFactory.boto,
          LegendFactory.cobraGrande,
          LegendFactory.curupira,
          LegendFactory.iara,
          LegendFactory.mapinguari,
          LegendFactory.matinta,
          LegendFactory.muiraquita,
          LegendFactory.vitoriaRegia,
        ],
        newItems: ['id_vitoria_regia'],
      );

  static List<RunningGameRules> get all => [
        RunningGameRulebook.level1,
        RunningGameRulebook.level2,
        RunningGameRulebook.level3,
        RunningGameRulebook.level4,
        RunningGameRulebook.level5,
        RunningGameRulebook.level6,
      ];
}
