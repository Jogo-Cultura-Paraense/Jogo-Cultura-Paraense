part of 'save_bloc.dart';

@immutable
abstract class SaveState {
  final int currentSaveIndex;
  final List<Save> saves;

  Save get currentSave => saves[currentSaveIndex];

  const SaveState({this.currentSaveIndex, this.saves});
}

class SaveInitial extends SaveState {}

class SaveLoading extends SaveState {}

class SaveLoaded extends SaveState {
  const SaveLoaded({int currentSaveIndex, List<Save> saves})
      : super(currentSaveIndex: currentSaveIndex, saves: saves);
}

class SaveFailed extends SaveState {
  final String error;
  const SaveFailed(this.error);
}
