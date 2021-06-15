import 'package:jogo_cultura_paraense/model/game.dart';
import 'package:jogo_cultura_paraense/model/game_save.dart';
import 'package:jogo_cultura_paraense/model/map.dart';

class MapSave {
  final String region;
  final String city;
  final bool isOpen;
  final List<GameSave> gamesSave;

  const MapSave({this.region, this.city, this.isOpen, this.gamesSave});

  int get gamesOpen {
    int gamesOpen = 0;
    for (GameSave game in gamesSave) {
      if (game.isOpen) gamesOpen += 1;
    }
    return gamesOpen;
  }

  GameSave getGameSave(String game) {
    for (GameSave gameSave in gamesSave) {
      if (gameSave.title == game) return gameSave;
    }
    throw Exception('Game "$game" not found.');
  }

  factory MapSave.initial(
    GameMap map, {
    bool isOpen = false,
    List<String> order,
  }) {
    // Check if a order has been sent. If not, then set default order.
    if (order == null) {
      order = <String>[
        Games.cooking,
        Games.archAndFestiv,
        Games.faunaAndFlora,
        Games.legendAndMyths,
        Games.vocabulary,
        Games.music,
      ];
    }
    // If it has, then check if there are 6 elements.
    else if (order.length != 6) {
      throw FormatException('Parameter order must have 6 elements');
    }

    return MapSave(
      region: map.region,
      city: map.city,
      isOpen: isOpen,
      gamesSave: <GameSave>[
        // First game of every map is always open.
        GameSave.initial(order[0], isOpen: true),
        GameSave.initial(order[1]),
        GameSave.initial(order[2]),
        GameSave.initial(order[3]),
        GameSave.initial(order[4]),
        GameSave.initial(order[5]),
      ],
    );
  }

  factory MapSave.fromJson(Map<String, dynamic> json) {
    return MapSave(
      region: json['region'],
      city: json['city'],
      isOpen: json['isOpen'],
      gamesSave: GameSave.fromJsonList(json['gamesSave']),
    );
  }

  static List<MapSave> fromJsonList(List<dynamic> jsonList) {
    final list = <MapSave>[];
    for (Map<String, dynamic> json in jsonList) {
      list.add(MapSave.fromJson(json));
    }
    return list;
  }

  static List<Map<String, dynamic>> toJsonList(List<MapSave> savesList) {
    final list = <Map<String, dynamic>>[];
    for (MapSave save in savesList) {
      list.add(save.toJson());
    }
    return list;
  }

  Map<String, dynamic> toJson() {
    return {
      'region': region,
      'city': city,
      'isOpen': isOpen,
      'gamesSave': GameSave.toJsonList(gamesSave),
    };
  }

  // Copy the current instance while inserting new values passed as params
  MapSave copyWith({
    String region,
    String city,
    bool isOpen,
    List<GameSave> gamesSave,
  }) {
    return MapSave(
      region: region ?? this.region,
      city: city ?? this.city,
      isOpen: isOpen ?? this.isOpen,
      gamesSave: gamesSave ?? this.gamesSave,
    );
  }
}
