import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jogo_cultura_paraense/components/home/buttons_top.dart';
import 'package:jogo_cultura_paraense/components/home/home_components.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home';
  static ImageProvider<Object> backgroundImage;
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MenuAppBar(
      bodyWidget: MainMenu(),
    );
  }
}
