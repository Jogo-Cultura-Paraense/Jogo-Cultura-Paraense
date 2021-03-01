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
