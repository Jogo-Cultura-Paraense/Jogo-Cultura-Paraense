import 'package:jogo_cultura_paraense/model/item_save.dart';
import 'package:jogo_cultura_paraense/model/map.dart';
import 'package:jogo_cultura_paraense/model/map_save.dart';

abstract class Saves {
  static const String cupuacu = 'Cupuaçu';
  static const String nazinha = 'Nazinha';
  static const String boto = 'Boto';

  static List<String> get saves => [Saves.cupuacu, Saves.nazinha, Saves.boto];
}

class Save {
  final String title;
  final List<ItemSave> itensSave;
  final List<MapSave> mapsSave;

  const Save({this.title, this.itensSave, this.mapsSave});

  String get getProgress {
    int totalGames = -1;
    int openGames = -1;
    for (MapSave mapSave in mapsSave) {
      totalGames += mapSave.gamesSave.length;
      openGames += mapSave.gamesOpen;
    }

    return ((openGames / totalGames) * 100).toStringAsFixed(1);
  }

  MapSave getMapSave(String region) {
    for (MapSave mapSave in mapsSave) {
      if (mapSave.region == region) return mapSave;
    }
    throw Exception('Region "$region" not found.');
  }

  factory Save.initial(String title) {
    return Save(
      title: title,
      itensSave: <ItemSave>[],
      mapsSave: <MapSave>[
        // First map of every save is always open.
        MapSave.initial(Maps.sudoeste, isOpen: true),
        MapSave.initial(Maps.baixoAmazonas),
        MapSave.initial(Maps.sudeste),
        MapSave.initial(Maps.nordeste),
        MapSave.initial(Maps.marajo),
        MapSave.initial(Maps.metropolitana),
      ],
    );
  }

  factory Save.fromJson(Map<String, dynamic> json) {
    return Save(
      title: json['title'],
      itensSave: ItemSave.fromJsonList(json['itensSave']),
      mapsSave: MapSave.fromJsonList(json['mapsSave']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'itensSave': ItemSave.toJsonList(itensSave),
      'mapsSave': MapSave.toJsonList(mapsSave),
    };
  }
}
