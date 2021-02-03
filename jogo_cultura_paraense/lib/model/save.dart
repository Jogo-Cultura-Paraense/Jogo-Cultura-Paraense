import 'package:jogo_cultura_paraense/model/game_save.dart';

abstract class Saves {
  static const String cupuacu = 'Cupuaçu';
  static const String nazinha = 'Nazinha';
  static const String boto = 'Boto';

  static List<String> get saves => [Saves.cupuacu, Saves.nazinha, Saves.boto];
}

class Save {
  final String title;
  final List<GameSave> savedGames;

  const Save({this.title, this.savedGames});

  factory Save.initial(String title) {
    return Save(
      title: title,
      savedGames: <GameSave>[
        GameSave.initial(Games.cooking),
        GameSave.initial(Games.archAndFestiv),
        GameSave.initial(Games.faunaAndFlora),
        GameSave.initial(Games.legendAndMyths),
        GameSave.initial(Games.vocabulary),
        GameSave.initial(Games.rhythms),
      ],
    );
  }

  factory Save.fromJson(Map<String, dynamic> json) {
    return Save(
      title: json['title'],
      savedGames: GameSave.fromJsonList(json['savedGames']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'savedGames': GameSave.toJsonList(savedGames),
    };
  }
}
