import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jogo_cultura_paraense/bloc/save/save_bloc.dart';
import 'package:jogo_cultura_paraense/games/art_fauna_flora/art_fauna_flora_game.dart';
import 'package:jogo_cultura_paraense/games/art_fauna_flora/models/rules.dart';
import 'package:jogo_cultura_paraense/model/game.dart';
import 'package:jogo_cultura_paraense/model/map.dart';

class ArtFaunaFloraGamePage extends StatelessWidget {
  static const String routeName = '/art_fauna_flora_game';
  final ArtFaunaFloraGameRules rules;
  const ArtFaunaFloraGamePage({@required this.rules, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SaveBloc, SaveState>(
      buildWhen: (previousState, currentState) {
        return previousState.currentSave != currentState.currentSave;
      },
      builder: (context, state) {
        final topScores = state.currentSave
            .getMapSave(Maps.sudoeste.region)
            .getGameSave(Games.faunaAndFlora)
            .topScores;
        return ArtFaunaFloraGame(
          context: context,
          gameMap: rules.map,
          topScore: topScores.isEmpty ? 0 : topScores[0],
          numTargets: rules.numTargets,
          startTime: rules.startTime,
          timeCorrectTile: rules.timeCorrectTile,
          timeIncorrectTile: rules.timeIncorrectTile,
          spritesRange: rules.spritesRange,
        ).widget;
      },
    );
  }
}
