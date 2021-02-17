part of 'map_bloc.dart';

@immutable
abstract class MapEvent {}

class LoadMapAssets extends MapEvent {
  final String region;
  final int gamesOpen;

  LoadMapAssets(this.region, this.gamesOpen);
}

class CompleteMapAssets extends MapEvent {}

class FailMapAssets extends MapEvent {}

class SetCurrentMap extends MapEvent {
  final String currentMap;

  SetCurrentMap(this.currentMap);
}
