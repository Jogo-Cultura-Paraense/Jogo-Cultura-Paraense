import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/components/level_selection/locked_game_alert.dart';

class LevelSelectionCard extends StatelessWidget {
  const LevelSelectionCard({
    Key key,
    this.title,
    this.onTap,
    this.level,
    this.unlocked,
  }) : super(key: key);

  final String title;
  final Function onTap;
  final int level;
  final bool unlocked;

  void _lockedGame(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return LockedGameAlert();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300.0,
        height: 75.0,
        child: Card(
          color: unlocked ? Colors.white : Colors.blueGrey[200],
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () => unlocked ? onTap() : _lockedGame(context),
            child: Center(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: level,
                itemBuilder: (BuildContext context, int index) {
                  return Icon(
                    Icons.star,
                    size: 32,
                    color: unlocked ? Colors.black : Colors.blueGrey[300],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
