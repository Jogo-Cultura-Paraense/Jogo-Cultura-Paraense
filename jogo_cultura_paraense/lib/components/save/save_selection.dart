import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jogo_cultura_paraense/bloc/save/save_bloc.dart';
import 'package:jogo_cultura_paraense/components/save/save_alert.dart';

class SaveSelection extends StatelessWidget {
  final Widget _child;
  const SaveSelection({@required Widget child, Key key})
      : _child = child,
        super(key: key);

  static void show(context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const SaveAlert();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SaveBloc, SaveState>(
      buildWhen: (previousState, currentState) {
        if (currentState is SaveLoaded &&
            previousState.currentSave != currentState.currentSave) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        if ((state is SaveLoaded && state.currentSave == null) ||
            state is SaveInitial) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            SaveSelection.show(context);
          });
        }
        return _child;
      },
      listenWhen: (previousState, currentState) {
        if (currentState is SaveLoaded && currentState.currentSave == null) {
          return true;
        }
        return false;
      },
      listener: (context, state) {
        if (state is SaveLoaded && state.currentSave == null) {
          SaveSelection.show(context);
        }
      },
    );
  }
}
