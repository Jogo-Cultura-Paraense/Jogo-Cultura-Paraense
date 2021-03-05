part of 'map_bloc.dart';

@immutable
abstract class MapEvent {}

class LoadMapAssets extends MapEvent {
  final String region;
  final int gamesOpen;

  LoadMapAssets(this.region, this.gamesOpen);
}
