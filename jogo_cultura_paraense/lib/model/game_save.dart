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
  final bool isOpen;
  final List<int> topScores;

  GameSave({this.title, this.isOpen, this.topScores});

  factory GameSave.initial(String title, {bool isOpen = false}) {
    return GameSave(
      title: title,
      isOpen: isOpen,
      topScores: <int>[],
    );
  }

  factory GameSave.fromJson(Map<String, dynamic> json) {
    return GameSave(
      title: json['title'],
      isOpen: json['isOpen'],
      topScores: (json['topScores'] as List<dynamic>).cast<int>(),
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
      'isOpen': isOpen,
      'topScores': topScores,
    };
  }

  // Copy the current instance while inserting new values passed as params
  GameSave copyWith({String title, bool isOpen, List<int> topScores}) {
    return GameSave(
      title: title ?? this.title,
      isOpen: isOpen ?? this.isOpen,
      topScores: topScores ?? this.topScores,
    );
  }
}
