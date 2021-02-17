import 'package:flutter/material.dart';

@immutable
class MapAssets {
  final String image;
  final String region;

  const MapAssets({this.image, this.region});

  factory MapAssets.fromJson(Map<String, dynamic> json) {
    return MapAssets(
      image: json['mapImage']['url'],
      region: json['region'],
    );
  }
}
