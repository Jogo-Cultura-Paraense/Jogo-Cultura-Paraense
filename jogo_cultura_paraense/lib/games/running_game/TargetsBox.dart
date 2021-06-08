import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jogo_cultura_paraense/games/running_game/bloc/running_game_bloc.dart';
import 'package:jogo_cultura_paraense/games/running_game/models/legend.dart';

class TargetsBox extends StatelessWidget {
  const TargetsBox({Key key}) : super(key: key);

  List<Widget> buildTargets(List<Legend> legends) {
    final targets = <Widget>[];
    for (Legend legend in legends) {
      targets.add(
        Text(
          '1 X ${legend.id}',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14.0,
          ),
        ),
      );
    }
    return targets;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RunningGameBloc, RunningGameState>(
      buildWhen: (previousState, nextState) {
        if (previousState.legends.length > nextState.legends.length) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        final list = buildTargets(state.legends);
        return Flexible(
          flex: 30,
          child: FractionallySizedBox(
            widthFactor: 0.5,
            heightFactor: 0.2,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [Icon(Icons.camera_alt, color: Colors.white)],
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return list[index];
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
