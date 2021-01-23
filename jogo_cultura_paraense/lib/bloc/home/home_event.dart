part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class LoadHomeAssets extends HomeEvent {}

class CompleteHomeAssets extends HomeEvent {}

class FailHomeAssets extends HomeEvent {}
