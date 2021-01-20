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
    } else if (now.hour >= 12 && now.hour <= 18) {
      period = "tarde";
    } else {
      period = "noite";
    }
    print(period);
    return period;
  }

  String getImage() {
    var period = checkTime();
    if (period == "manhã")
      return "lib/images/MorningBackground.png";
    else if (period == "tarde")
      return "lib/images/EveningBackground.png";
    else
      return "lib/images/NightBackground.png";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(getImage()), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: <Widget>[
            _MainMenuIconButton(
              icon: Icons.share,
              onClick: () => _share(context),
            ),
            _MainMenuIconButton(
              icon: Icons.info_outline_rounded,
              onClick: () => _info(context),
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.0),
          child: MainMenu(),
        ),
      ),
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

class _MainMenuIconButton extends StatelessWidget {
  final IconData icon;
  final Function onClick;

  const _MainMenuIconButton({this.icon, this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2),
      child: FloatingActionButton(
        child: Icon(icon),
        elevation: 0,
        onPressed: () => onClick(),
      ),
    );
  }
}
