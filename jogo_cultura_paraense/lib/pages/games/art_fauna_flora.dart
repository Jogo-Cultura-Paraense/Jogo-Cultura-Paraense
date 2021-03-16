import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jogo_cultura_paraense/bloc/save/save_bloc.dart';
import 'package:jogo_cultura_paraense/games/artesanato-fauna-flora/find_game.dart';
import 'package:jogo_cultura_paraense/model/game_save.dart';
import 'package:jogo_cultura_paraense/model/map_save.dart';

class ArtFaunaFloraGamePage extends StatelessWidget {
  static const String routeName = '/art_fauna_flora_game';
  const ArtFaunaFloraGamePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SaveBloc, SaveState>(
      buildWhen: (previousState, currentState) {
        return previousState.currentSave != currentState.currentSave;
      },
      builder: (context, state) {
        final topScores = state.currentSave
            .getMapSave(Maps.sudoeste.name)
            .getGameSave(Games.faunaAndFlora)
            .topScores;
        return FindGame(
          context: context,
          topScore: topScores.isEmpty ? 0 : topScores[0],
        ).widget;
      },
    );
  }
}
