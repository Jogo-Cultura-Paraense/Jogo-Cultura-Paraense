part of 'encyclopedia_bloc.dart';

@immutable
abstract class EncyclopediaState {
  const EncyclopediaState();
}

class EncyclopediaInitial extends EncyclopediaState {}

class EncyclopediaLoading extends EncyclopediaState {}

class EncyclopediaFailed extends EncyclopediaState {
  final String error;
  const EncyclopediaFailed(this.error);
}

class EncyclopediaLoaded extends EncyclopediaState {
  final List<EncyclopediaEntry> entries;
  const EncyclopediaLoaded(this.entries);
}
