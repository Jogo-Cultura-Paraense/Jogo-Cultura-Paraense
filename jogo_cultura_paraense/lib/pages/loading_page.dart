import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jogo_cultura_paraense/components/loading/loading_home.dart';

class LoadingPage extends StatelessWidget {
  static const String routeName = '/';
  const LoadingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("lib/images/LoadingBackground.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: const LoadingHomeAssets(),
      ),
    );
  }
}
