import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jogo_cultura_paraense/bloc/save/save_bloc.dart';
import 'package:jogo_cultura_paraense/games/art_fauna_flora/art_fauna_flora_game.dart';
import 'package:jogo_cultura_paraense/model/game_save.dart';
import 'package:jogo_cultura_paraense/model/map.dart';

class ArtFaunaFloraGamePageArgs {
  final String map;
  final int numTargets;
  final double startTime;
  final double timeCorrectTile;
  final double timeIncorrectTile;
  final int spritesRange;

  const ArtFaunaFloraGamePageArgs({
    @required this.map,
    @required this.numTargets,
    @required this.startTime,
    @required this.timeCorrectTile,
    @required this.timeIncorrectTile,
    @required this.spritesRange,
  });

  factory ArtFaunaFloraGamePageArgs.initial() {
    return ArtFaunaFloraGamePageArgs(
      map: Maps.sudoeste.region,
      numTargets: 4,
      startTime: 5,
      timeCorrectTile: 2,
      timeIncorrectTile: -1,
      spritesRange: 13,
    );
  }
}

class ArtFaunaFloraGamePage extends StatelessWidget {
  static const String routeName = '/art_fauna_flora_game';
  const ArtFaunaFloraGamePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ArtFaunaFloraGamePageArgs args =
        ModalRoute.of(context).settings.arguments ??
            ArtFaunaFloraGamePageArgs.initial();

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
          gameMap: args.map,
          topScore: topScores.isEmpty ? 0 : topScores[0],
          numTargets: args.numTargets,
          startTime: args.startTime,
          timeCorrectTile: args.timeCorrectTile,
          timeIncorrectTile: args.timeIncorrectTile,
          spritesRange: args.spritesRange,
        ).widget;
      },
    );
  }
}
