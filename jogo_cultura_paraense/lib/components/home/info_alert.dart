import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jogo_cultura_paraense/bloc/home/home_bloc.dart';
import 'package:jogo_cultura_paraense/components/alert_dialog.dart';

class InfoAlert extends StatelessWidget {
  const InfoAlert({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (dynamic currentState, dynamic nextState) {
        return currentState.homeAssets.background !=
            nextState.homeAssets.background;
      },
      builder: (context, dynamic state) {
        return CustomAlertDialog(
          title: Text(
            'Você sabia?',
            textAlign: TextAlign.center,
          ),
          content: Text(
            state.homeAssets.info,
            textAlign: TextAlign.center,
          ),
          floatingChild: FloatingActionButton(
            child: Icon(Icons.help),
            onPressed: () {},
          ),
        );
      },
    );
  }
}
