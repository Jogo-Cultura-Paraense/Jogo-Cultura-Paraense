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
    return BlocBuilder<SaveBloc, SaveState>(
      buildWhen: (previousState, currentState) {
        if (previousState is SaveLoaded &&
            currentState is SaveLoaded &&
            previousState.currentSaveIndex != currentState.currentSaveIndex) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        if (state.currentSave == null) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            SaveSelection.show(context);
          });
        }
        return _child;
      },
    );
  }
}
