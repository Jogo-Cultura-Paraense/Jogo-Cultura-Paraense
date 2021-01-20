import 'package:flutter/material.dart';

@immutable
class HomeAssets {
  final String background;
  final String info;

  const HomeAssets({this.background, this.info});

  factory HomeAssets.fromJson(Map<String, dynamic> json) {
    return HomeAssets(
      background: json['background'],
      info: json['info'],
    );
  }
}
