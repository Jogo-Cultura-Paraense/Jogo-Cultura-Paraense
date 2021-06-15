import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jogo_cultura_paraense/bloc/save/save_bloc.dart';
import 'package:jogo_cultura_paraense/games/musica/components/bgm.dart';
import 'package:jogo_cultura_paraense/games/musica/musica_game.dart';
import 'package:jogo_cultura_paraense/model/game.dart';
import 'package:jogo_cultura_paraense/model/map.dart';

class MusicGamePageArgs {
  final String map;

  final double startTime;
  final double timeBetweenDiscs;
  final int level;

  const MusicGamePageArgs(
      {@required this.timeBetweenDiscs,
        @required this.map,
        @required this.startTime,
        @required this.level});

  factory MusicGamePageArgs.initial() {
    return MusicGamePageArgs(
        map: Maps.sudoeste.region,
        startTime: 60,
        timeBetweenDiscs: 1,
        level: 1);
  }
}

class MusicGameGamePage extends StatelessWidget {
  static const String routeName = '/musica_game';
  const MusicGameGamePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //BGM.removeAll(); //para a música, caso esteja tocando

    final MusicGamePageArgs args = ModalRoute.of(context).settings.arguments ??
        MusicGamePageArgs.initial();

    return BlocBuilder<SaveBloc, SaveState>(
      buildWhen: (previousState, currentState) {
        BGM.removeAll(); //para a música, caso esteja tocando
        return previousState.currentSave != currentState.currentSave;
      },
      builder: (context, state) {
        final topScores = state.currentSave
            .getMapSave(Maps.sudoeste.region)
            .getGameSave(Games.music)
            .topScores;
        return WillPopScope(
          onWillPop: () {
            if (BGM.isPlaying) {
              BGM.stop();
              BGM.removeAll();
            } //para a música, caso esteja tocando
            Navigator.of(context).pop();
          },
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            child: MusicaGame(
                context: context,
                gameMap: args.map,
                topScore: topScores.isEmpty ? 0 : topScores[0],
                startTime: args.startTime,
                timeBetweenDiscs: args.timeBetweenDiscs,
                level: args.level)
                .widget,
          ),
        );
      },
    );
  }
}