import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jogo_cultura_paraense/components/home/home_components.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  String getImage() {
    return "lib/images/EveningBackground.png";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(getImage()), fit: BoxFit.cover
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2),
              child: FloatingActionButton(
                child: Icon(Icons.share),
                elevation: 0,
                onPressed: () {
                  _share(context);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2),
              child: FloatingActionButton(
                child: Icon(Icons.info_outline_rounded),
                elevation: 0,
                onPressed: () {
                  _info(context);
                },
              ),
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.0),
          child: MainMenu(),
        )
      )
    );
  }

  void _share(BuildContext context) {}

  void _info(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return const InfoAlert();
      }
    );
  }
}
