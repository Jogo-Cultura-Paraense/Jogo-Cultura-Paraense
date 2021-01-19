import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainMenu(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.info),
      ),
    );
  }
}

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.only(top: 64.0, left: 32.0, right: 32.0),
      child: Column(
        children: <Widget>[
          const Text(
            'Jogo Cultura Paraense',
            style: TextStyle(fontSize: 16.0),
          ),
          MainMenuButton(label: 'JOGAR'),
          MainMenuButton(label: 'ENCICLOPÉDIA'),
          MainMenuButton(label: 'CONFIGURAÇÕES'),
          MainMenuButton(label: 'SOBRE'),
        ],
      ),
    ));
  }
}

class MainMenuButton extends StatelessWidget {
  final String label;
  final Function function;

  const MainMenuButton({this.label, this.function});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: SizedBox(
        width: double.maxFinite,
        child: RaisedButton(
          child: Text(label),
          onPressed: () => function,
        ),
      ),
    );
  }
}
