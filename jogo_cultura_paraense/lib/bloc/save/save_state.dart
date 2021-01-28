part of 'save_bloc.dart';

@immutable
abstract class SaveState {
  final int currentSave;
  final List<Save> saves;

  const SaveState({this.currentSave, this.saves});
}

class SaveInitial extends SaveState {}

class SaveLoading extends SaveState {}

class SaveLoaded extends SaveState {
  const SaveLoaded({int currentSave, List<Save> saves})
      : super(currentSave: currentSave, saves: saves);
}

class SaveFailed extends SaveState {
  final String error;
  const SaveFailed(this.error);
}
