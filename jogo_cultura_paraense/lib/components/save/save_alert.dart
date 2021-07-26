import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jogo_cultura_paraense/bloc/save/save_bloc.dart';
import 'package:jogo_cultura_paraense/components/loading_progress.dart';
import 'package:jogo_cultura_paraense/components/simple_dialog.dart';
import 'package:jogo_cultura_paraense/pages/dev.dart';

class SaveAlert extends StatelessWidget {
  const SaveAlert({Key key}) : super(key: key);

  List<Widget> _buildSaveTitles(BuildContext context, SaveState state) {
    final titles = <Widget>[];
    for (int i = 0; i < state.saves.length; i += 1) {
      titles.add(_SaveTitle(
        title: state.saves[i].title,
        progress: 'Progresso: ${state.saves[i].getProgress}% desbloqueado',
        isSelected: i == state.currentSaveIndex,
        onTap: () {
          BlocProvider.of<SaveBloc>(context).add(SetCurrentSave(i));
        },
      ));
    }
    if (state.currentSaveIndex != null) {
      titles.add(
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 80.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'Fechar',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).primaryColor,
              onPrimary: Theme.of(context).primaryColor,
            ),
          ),
        ),
      );
    }
    return titles;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SaveBloc, SaveState>(
      buildWhen: (currentState, nextState) {
        if (currentState is SaveLoaded) {
          return currentState.currentSaveIndex != nextState.currentSaveIndex;
        }
        return true;
      },
      builder: (context, state) {
        if (state is SaveLoaded) {
          return CustomSimpleDialog(
            title: Text(
              'Escolha um progresso',
              textAlign: TextAlign.center,
            ),
            dialogHeight: 400,
            children: _buildSaveTitles(context, state),
            floatingChildHeight: 400,
            floatingChild: ElevatedButton(
              child: Text(
                'Progressos Salvos',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor,
                onPrimary: Theme.of(context).primaryColor,
              ),
            ),
          );
        } else if (state is SaveFailed) {
          return AlertDialog(content: Text(state.error));
        } else {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            BlocProvider.of<SaveBloc>(context).add(LoadSave());
          });
          return const LoadingProgress();
        }
      },
    );
  }
}

class _SaveTitle extends StatelessWidget {
  final String _title;
  final String _progress;
  final bool _isSelected;
  final Function _onTap;

  const _SaveTitle({
    @required String title,
    @required String progress,
    @required bool isSelected,
    @required Function onTap,
    Key key,
  })  : _title = title,
        _progress = progress,
        _isSelected = isSelected,
        _onTap = onTap,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: ListTile(
        title: Text(
          _title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        subtitle: Text(
          _progress,
          style: TextStyle(
            color: Colors.white,
            fontSize: 13,
          ),
        ),
        trailing: Icon(
          _isSelected
              ? Icons.radio_button_checked
              : Icons.radio_button_unchecked,
          color: Colors.white,
        ),
        onTap: _onTap,
        // For dev purposes, should be removed on production
        onLongPress: () {
          Navigator.of(context).pushNamed(DevPage.routeName);
        },
      ),
    );
  }
}
