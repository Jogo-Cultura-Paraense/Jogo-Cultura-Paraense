import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jogo_cultura_paraense/games/running_game/bloc/running_game_bloc.dart';
import 'package:jogo_cultura_paraense/games/running_game/LifeBox.dart';
import 'package:jogo_cultura_paraense/games/running_game/HintsBox.dart';
import 'package:jogo_cultura_paraense/games/running_game/TargetsBox.dart';
import 'package:jogo_cultura_paraense/games/running_game/TimeBox.dart';
import 'package:jogo_cultura_paraense/games/running_game/gesture_box.dart';

class RunningGameScaffold extends StatefulWidget {
  const RunningGameScaffold({Key key}) : super(key: key);

  @override
  _RunningGameScaffoldState createState() => _RunningGameScaffoldState();
}

class _RunningGameScaffoldState extends State<RunningGameScaffold> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    // ignore: close_sinks
    final bloc = BlocProvider.of<RunningGameBloc>(context);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: deviceHeight,
            width: deviceWidth,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/running_game/bg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TargetsBox(),
              TimeBox(timeLimit: bloc.state.rules.time),
              LifeBox()
            ],
          ),
          GestureBox(
            deviceHeight,
            deviceWidth,
            legendPool: bloc.state.legends,
            speed: bloc.state.rules.speed,
            onLegendCollision: (String legendId) {
              bloc.add(RemoveLegend(legendId));
            },
            onObstacleCollision: () {
              bloc.add(RemoveLife());
            },
          ).widget,
          HintsBox()
        ],
      ),
    );
  }
}
