import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jogo_cultura_paraense/games/running_game/bloc/running_game_bloc.dart';

class LifeBox extends StatelessWidget {
  const LifeBox({Key key}) : super(key: key);

  List<Widget> buildLifeIcons(int lifes) {
    final lifeIcons = <Widget>[];
    for (int i = 0; i < lifes; i += 1) {
      lifeIcons.add(Icon(Icons.favorite, color: Colors.white));
    }
    return lifeIcons;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RunningGameBloc, RunningGameState>(
      buildWhen: (previousState, nextState) {
        if (previousState.lifes > nextState.lifes) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        return Flexible(
          flex: 15,
          child: FractionallySizedBox(
            widthFactor: 0.9,
            heightFactor: 0.15,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'Vidas restantes:',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: buildLifeIcons(state.lifes),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
