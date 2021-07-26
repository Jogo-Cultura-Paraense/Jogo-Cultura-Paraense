import 'package:flutter/material.dart';

@immutable
class MapAssets {
  final String image;
  final String region;
  final int gamesOpen;

  const MapAssets({this.image, this.region, this.gamesOpen});

  factory MapAssets.fromJson(Map<String, dynamic> json) {
    return MapAssets(
      image: json['mapImage']['url'],
      region: json['region'],
      gamesOpen: json['gamesOpen'],
    );
  }
}
