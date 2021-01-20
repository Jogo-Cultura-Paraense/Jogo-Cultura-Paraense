import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jogo_cultura_paraense/pages/home_page.dart';
import 'dart:async';

class LoadingPage extends StatefulWidget {
  static const String routeName = '/';

  const LoadingPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return StartState();
  }
}

class StartState extends State<LoadingPage> {
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Timer(Duration(seconds: 4), () {
        Navigator.of(context).popAndPushNamed(HomePage.routeName);
      });
    });

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("lib/images/LoadingBackground.png"),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(
                backgroundColor: Colors.white,
                strokeWidth: 3,
              )
            ],
          ),
        ),
      ),
    );
  }
}
