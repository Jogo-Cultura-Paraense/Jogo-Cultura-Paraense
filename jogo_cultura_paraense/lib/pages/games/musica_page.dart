import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jogo_cultura_paraense/bloc/save/save_bloc.dart';
import 'package:jogo_cultura_paraense/games/musica/components/bgm.dart';
import 'package:jogo_cultura_paraense/games/musica/models/rules.dart';
import 'package:jogo_cultura_paraense/games/musica/musica_game.dart';
import 'package:jogo_cultura_paraense/model/game.dart';
import 'package:jogo_cultura_paraense/model/map.dart';

class MusicGamePage extends StatelessWidget {
  static const String routeName = '/musica_game';
  final MusicGameRules rules;
  const MusicGamePage({@required this.rules, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //BGM.removeAll(); //para a música, caso esteja tocando
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
              gameMap: rules.map,
              topScore: topScores.isEmpty ? 0 : topScores[0],
              startTime: rules.startTime,
              timeBetweenDiscs: rules.timeBetweenDiscs,
              level: rules.level,
            ).widget,
          ),
        );
      },
    );
  }
}
