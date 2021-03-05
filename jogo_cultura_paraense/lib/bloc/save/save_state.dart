part of 'save_bloc.dart';

@immutable
abstract class SaveState {
  final String error;
  final int currentSaveIndex;
  final List<Save> saves;

  Save get currentSave => saves[currentSaveIndex];

  const SaveState({this.error, this.currentSaveIndex, this.saves});

  SaveLoading saveLoading({int currentSaveIndex, List<Save> saves}) {
    return SaveLoading(
      currentSaveIndex: currentSaveIndex ?? this.currentSaveIndex,
      saves: saves ?? this.saves,
    );
  }

  SaveLoaded saveLoaded({int currentSaveIndex, List<Save> saves}) {
    return SaveLoaded(
      currentSaveIndex: currentSaveIndex ?? this.currentSaveIndex,
      saves: saves ?? this.saves,
    );
  }

  SaveFailed saveFailed({String error}) {
    return SaveFailed(
      error: error ?? this.error,
      currentSaveIndex: this.currentSaveIndex,
      saves: this.saves,
    );
  }
}

class SaveInitial extends SaveState {}

class SaveLoading extends SaveState {
  const SaveLoading({int currentSaveIndex, List<Save> saves})
      : super(currentSaveIndex: currentSaveIndex, saves: saves);
}

class SaveLoaded extends SaveState {
  const SaveLoaded({int currentSaveIndex, List<Save> saves})
      : super(currentSaveIndex: currentSaveIndex, saves: saves);
}

class SaveFailed extends SaveState {
  const SaveFailed({String error, int currentSaveIndex, List<Save> saves})
      : super(error: error, currentSaveIndex: currentSaveIndex, saves: saves);
}
