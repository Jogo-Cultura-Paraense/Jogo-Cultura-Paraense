import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jogo_cultura_paraense/pages/home_page.dart';
import 'dart:async';

class LoadingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StartState();
  }
}

class StartState extends State<LoadingPage>{
  @override
  void initState() {
    super.initState();
    startTime();
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/images/LoadingBackground.png")
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center (
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(
                backgroundColor: Colors.white,
                strokeWidth: 3,
              )
            ]
          )
        )
      )
    );
  }

  startTime() {
    var duration = Duration(seconds: 4);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => HomePage())
    );
  }
}