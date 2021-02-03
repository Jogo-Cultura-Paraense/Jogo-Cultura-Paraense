import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jogo_cultura_paraense/bloc/save/save_bloc.dart';
import 'package:jogo_cultura_paraense/components/home/save_alert.dart';
import 'package:jogo_cultura_paraense/pages/enciclopedia.dart';

class EnciclopediaPage extends StatelessWidget {
  static const String routeName = '/enciclopedia';

  const EnciclopediaPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Enciclopédia'),
      ),
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
          return const Enciclopedia();
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
