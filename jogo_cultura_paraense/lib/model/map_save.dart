import 'package:jogo_cultura_paraense/model/game_save.dart';

class Region {
  final String name;
  final String mainCity;
  const Region({this.name, this.mainCity});
}

abstract class Maps {
  static const Region sudoeste = Region(
    name: 'Sudoeste',
    mainCity: 'Altamira',
  );
  static const Region baixoAmazonas = Region(
    name: 'Baixo Amazonas',
    mainCity: 'Santarém',
  );

  static const Region sudeste = Region(
    name: 'Sudeste',
    mainCity: 'Marabá',
  );
  static const Region nordeste = Region(
    name: 'Nordeste',
    mainCity: 'Abaetetuba',
  );
  static const Region marajo = Region(
    name: 'Marajó',
    mainCity: 'Breves',
  );
  static const Region metropolitana = Region(
    name: 'Metropolitana',
    mainCity: 'Belém',
  );
}

class MapSave {
  final String region;
  final String city;
  final bool isOpen;
  final List<GameSave> gamesSave;

  int get gamesOpen {
    int gamesOpen = 0;
    for (GameSave game in gamesSave) {
      if (game.isOpen) gamesOpen += 1;
    }
    return gamesOpen;
  }

  const MapSave({this.region, this.city, this.isOpen, this.gamesSave});

  factory MapSave.initial(
    Region region, {
    bool isOpen = false,
    List<String> order,
  }) {
    // Check if a order has been sent.
    // If not, then set default order.
    if (order == null) {
      order = <String>[
        Games.cooking,
        Games.archAndFestiv,
        Games.faunaAndFlora,
        Games.legendAndMyths,
        Games.vocabulary,
        Games.rhythms,
      ];
    }
    // If it has, then check if there are 6 elements.
    else if (order.length != 6) {
      throw FormatException('Parameter order must have 6 elements');
    }

    return MapSave(
      region: region.name,
      city: region.mainCity,
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
      'gamesSave': GameSave.toJsonList(gamesSave),
    };
  }
}
