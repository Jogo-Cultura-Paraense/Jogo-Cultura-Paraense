part of 'save_bloc.dart';

@immutable
abstract class SaveEvent {
  const SaveEvent();
}

class LoadSave extends SaveEvent {}

class SetCurrentSave extends SaveEvent {
  final int nextCurrentSaveIndex;

  const SetCurrentSave(this.nextCurrentSaveIndex);
}

class SaveClearedGame extends SaveEvent {
  final String map;
  final String game;
  final int score;
  final List<String> itens;

  const SaveClearedGame(this.map, this.game, {this.score, this.itens});
}
