import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jogo_cultura_paraense/bloc/save/save_bloc.dart';
import 'package:jogo_cultura_paraense/components/home/save_alert.dart';
import 'package:jogo_cultura_paraense/pages/select_mini_game.dart';

class GameSelectPage extends StatelessWidget {
  static const String routeName = '/gameSelect';

  const GameSelectPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocConsumer<SaveBloc, SaveState>(
        buildWhen: (previousState, currentState) {
          if (currentState is SaveLoaded &&
              previousState.currentSave != currentState.currentSave) {
            return true;
          }
          return false;
        },
        builder: (context, state) {
          if (state is SaveLoaded && state.currentSave == null) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              _save(context);
            });
          }
          return GameSelection();
        },
        listenWhen: (previousState, currentState) {
          if (currentState is SaveLoaded && currentState.currentSave == null) {
            return true;
          }
          return false;
        },
        listener: (context, state) {
          if (state is SaveLoaded && state.currentSave == null) {
            _save(context);
          }
        },
      ),
    );
  }

  void _save(context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const SaveAlert();
      },
    );
  }
}