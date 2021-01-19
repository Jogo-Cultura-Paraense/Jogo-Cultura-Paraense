import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  MainMenuIconButton(
                    icon: Icons.share,
                    onClick: () => _share(context),
                  ),
                  MainMenuIconButton(
                    icon: Icons.info_outline_rounded,
                    onClick: () => _info(context),
                  ),
                ],
              ),
            ),
            Center(
              child: MainMenu(),
            ),
          ],
        ),
      ),
    );
  }

  void _share(BuildContext context) {
    print('share');
  }

  void _info(BuildContext context) {
    print('info');
  }
}

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        children: <Widget>[
          const Text(
            'Jogo Cultura Paraense',
            style: TextStyle(fontSize: 24.0),
          ),
          _MainMenuButton(
            label: 'JOGAR',
            onClick: () => _game(context),
          ),
          _MainMenuButton(
            label: 'ENCICLOPÉDIA',
            onClick: () => _enciclopedia(context),
          ),
          _MainMenuButton(
            label: 'CONFIGURAÇÕES',
            onClick: () => _settings(context),
          ),
          _MainMenuButton(
            label: 'SOBRE',
            onClick: () => _about(context),
          ),
        ],
      ),
    );
  }

  void _game(BuildContext context) {
    print('game...');
  }

  void _enciclopedia(BuildContext context) {
    print('enciclopedia...');
  }

  void _settings(BuildContext context) {
    print('settings...');
  }

  void _about(BuildContext context) {
    print('about...');
  }
}

// Widget modelo para criar botões no menu
class _MainMenuButton extends StatelessWidget {
  final String label;
  final Function onClick;

  const _MainMenuButton({this.label, this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: SizedBox(
        width: double.maxFinite,
        child: RaisedButton(
          child: Text(label),
          onPressed: () => onClick(),
        ),
      ),
    );
  }
}

class MainMenuIconButton extends StatelessWidget {
  final IconData icon;
  final Function onClick;

  const MainMenuIconButton({Key key, this.icon, this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Center(
        child: Ink(
          decoration: const ShapeDecoration(
            color: Colors.red,
            shape: CircleBorder(),
          ),
          child: IconButton(
              icon: Icon(icon),
              color: Colors.white,
              onPressed: () {
                onClick();
              }),
        ),
      ),
    );
  }
}
