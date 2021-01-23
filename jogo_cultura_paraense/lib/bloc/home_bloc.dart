import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:jogo_cultura_paraense/model/home_assets.dart';
import 'package:jogo_cultura_paraense/services/home_assets_service.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeAssetsService _homeAssetsService = HomeAssetsService();
  HomeBloc() : super(HomeInitial());

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is LoadHomeAssets) {
      yield HomeAssetsLoading();
      try {
        HomeAssets homeAssets = await _homeAssetsService.fetchHomeAssets();
        yield HomeAssetsLoaded(homeAssets);
      } catch (error) {
        yield HomeAssetsFailed(error.toString());
      }
    }
  }
}
