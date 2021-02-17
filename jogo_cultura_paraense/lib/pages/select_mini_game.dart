import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/components/home/buttons_top.dart';
import 'package:flutter/material.dart';

class GameSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MenuAppBar(
      bodyWidget: GameSelectionMenu(),
    );
  }
}

class GameSelectionMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 275.0,
              height: 60.0,
              child: Card(
                color: Colors.redAccent[700],
                child: Center(
                  child: Text(
                    'Escolha um Mini-jogo',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 350.0,
              height: 600.0,
              child: Card(
                color: Colors.redAccent[700],
                child: SizedBox(
                  width: 200.0,
                  height: 200.0,
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 8.0,
                    children: List.generate(
                      choices.length,
                          (index) {
                        return Center(
                          child: SelectCard(choice: choices[index]),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.onTap});
  final String title;
  final Function onTap;
}

List<Choice> choices = <Choice>[
  Choice(title: 'AAA', onTap: () => print("AAA")),
  Choice(title: 'BBB', onTap: () => print("BBB")),
  Choice(title: 'CCC', onTap: () => print("CCC")),
  Choice(title: 'DDD', onTap: () => print("DDD")),
  Choice(title: 'EEE', onTap: () => print("EEE")),
  Choice(title: 'FFF', onTap: () => print("FFF")),
];

class SelectCard extends StatelessWidget {
  const SelectCard({Key key, this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () => choice.onTap(),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    choice.title,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}