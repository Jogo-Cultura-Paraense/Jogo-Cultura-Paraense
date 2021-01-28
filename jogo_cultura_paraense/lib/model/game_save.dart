import 'package:jogo_cultura_paraense/model/item_save.dart';

abstract class Games {
  static const String cooking = 'Cooking Game';
  static const String archAndFestiv = 'Archteture and Festivities Game';
  static const String faunaAndFlora = 'Fauna and Flora Game';
  static const String legendAndMyths = 'Legends and Myths Game';
  static const String vocabulary = 'Vocabulary Game';
  static const String rhythms = 'Rhythms Game';
}

class GameSave {
  final String title;
  final List<ItemSave> savedItens;
  final List<List<int>> topScores;

  GameSave({this.title, this.savedItens, this.topScores});

  factory GameSave.initial(String title) {
    return GameSave(
      title: title,
      savedItens: <ItemSave>[],
      topScores: <List<int>>[<int>[]],
    );
  }

  factory GameSave.fromJson(Map<String, dynamic> json) {
    print(json['topScores']);
    return GameSave(
      title: json['title'],
      savedItens: ItemSave.fromJsonList(json['savedItens']),
      topScores: (json['topScores'] as List<dynamic>).cast<List<int>>(),
    );
  }

  static List<GameSave> fromJsonList(List<dynamic> jsonList) {
    final list = <GameSave>[];
    for (Map<String, dynamic> json in jsonList) {
      list.add(GameSave.fromJson(json));
    }
    return list;
  }

  static List<Map<String, dynamic>> toJsonList(List<GameSave> games) {
    final list = <Map<String, dynamic>>[];
    for (GameSave game in games) {
      list.add(game.toJson());
    }
    return list;
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'savedItens': ItemSave.toJsonList(savedItens),
      'topScores': topScores,
    };
  }
}
