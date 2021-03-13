part of 'map_bloc.dart';

@immutable
abstract class MapState {
  final String currentMap;

  const MapState({this.currentMap});
}

class MapInitial extends MapState {}

class MapAssetsLoading extends MapState {}

class MapAssetsLoaded extends MapState {
  final MapAssets mapAssets;
  MapAssetsLoaded(this.mapAssets);
}

class MapAssetsFailed extends MapState {
  final String error;
  MapAssetsFailed(this.error);
}
