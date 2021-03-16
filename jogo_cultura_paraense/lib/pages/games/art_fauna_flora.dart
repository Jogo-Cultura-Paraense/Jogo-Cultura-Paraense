import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jogo_cultura_paraense/bloc/save/save_bloc.dart';
import 'package:jogo_cultura_paraense/games/artesanato-fauna-flora/find_game.dart';
import 'package:jogo_cultura_paraense/games/artesanato-fauna-flora/find_game2.dart';
import 'package:jogo_cultura_paraense/games/artesanato-fauna-flora/find_game3.dart';
import 'package:jogo_cultura_paraense/games/artesanato-fauna-flora/find_game4.dart';
import 'package:jogo_cultura_paraense/games/artesanato-fauna-flora/find_game5.dart';
import 'package:jogo_cultura_paraense/games/artesanato-fauna-flora/find_game6.dart';
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

class ArtFaunaFloraGamePage2 extends StatelessWidget {
  static const String routeName = '/art_fauna_flora_game2';
  const ArtFaunaFloraGamePage2({Key key}) : super(key: key);

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
        return FindGame2(
          context: context,
          topScore: topScores.isEmpty ? 0 : topScores[0],
        ).widget;
      },
    );
  }
}

class ArtFaunaFloraGamePage3 extends StatelessWidget {
  static const String routeName = '/art_fauna_flora_game3';
  const ArtFaunaFloraGamePage3({Key key}) : super(key: key);

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
        return FindGame3(
          context: context,
          topScore: topScores.isEmpty ? 0 : topScores[0],
        ).widget;
      },
    );
  }
}

class ArtFaunaFloraGamePage4 extends StatelessWidget {
  static const String routeName = '/art_fauna_flora_game4';
  const ArtFaunaFloraGamePage4({Key key}) : super(key: key);

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
        return FindGame4(
          context: context,
          topScore: topScores.isEmpty ? 0 : topScores[0],
        ).widget;
      },
    );
  }
}

class ArtFaunaFloraGamePage5 extends StatelessWidget {
  static const String routeName = '/art_fauna_flora_game5';
  const ArtFaunaFloraGamePage5({Key key}) : super(key: key);

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
        return FindGame5(
          context: context,
          topScore: topScores.isEmpty ? 0 : topScores[0],
        ).widget;
      },
    );
  }
}

class ArtFaunaFloraGamePage6 extends StatelessWidget {
  static const String routeName = '/art_fauna_flora_game6';
  const ArtFaunaFloraGamePage6({Key key}) : super(key: key);

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
        return FindGame6(
          context: context,
          topScore: topScores.isEmpty ? 0 : topScores[0],
        ).widget;
      },
    );
  }
}
