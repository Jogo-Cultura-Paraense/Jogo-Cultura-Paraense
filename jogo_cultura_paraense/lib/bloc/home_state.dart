part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeAssetsLoading extends HomeState {}

class HomeAssetsLoaded extends HomeState {
  final HomeAssets homeAssets;
  HomeAssetsLoaded(this.homeAssets);
}

class HomeAssetsFailed extends HomeState {
  final String error;
  HomeAssetsFailed(this.error);
}
