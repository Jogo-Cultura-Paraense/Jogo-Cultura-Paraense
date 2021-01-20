import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:share/share.dart';
import 'package:jogo_cultura_paraense/components/home/home_components.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  String checkTime() {
    var now = new DateTime.now();
    var period = "";
    if (now.hour >= 6 && now.hour <= 12) {
      period = "manhã";
    } else if (now.hour >= 12 && now.hour <=18) {
      period = "tarde";
    } else {
      period = "noite";
    }
    return period;
  }

  String getImage() {
    var period = checkTime();
    if (period == "manhã") return "lib/images/MorningBackground.png";
    else if (period == "tarde") return "lib/images/EveningBackground.png";
    else return "lib/images/NightBackground.png";
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

  void _share(BuildContext context) {
    Share.share(
      'Jogo Cultura Paraense https://github.com/Jogo-Cultura-Paraense/Jogo-Cultura-Paraense',
      subject: 'Jogo Cultura Paraense!',
    );
  }

  void _info(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return const InfoAlert();
      },
    );
  }
}
