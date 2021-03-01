import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:jogo_cultura_paraense/model/map_assets.dart';
import 'package:jogo_cultura_paraense/services/map_assets_service.dart';
import 'package:meta/meta.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final MapAssetsService _mapAssetsService = MapAssetsService();
  MapBloc() : super(MapInitial());

  @override
  Stream<MapState> mapEventToState(
    MapEvent event,
  ) async* {
    if (event is LoadMapAssets) {
      yield MapAssetsLoading();
      try {
        MapAssets mapAssets = await _mapAssetsService.fetchMapAssets(
          event.region,
          event.gamesOpen,
        );
        yield MapAssetsLoaded(mapAssets);
      } catch (error) {
        yield MapAssetsFailed(error.toString());
      }
    }
  }
}
