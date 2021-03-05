import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jogo_cultura_paraense/bloc/home/home_bloc.dart';
import 'package:jogo_cultura_paraense/bloc/save/save_bloc.dart';
import 'package:jogo_cultura_paraense/components/home/save_alert.dart';
import 'package:share/share.dart';
import 'package:jogo_cultura_paraense/components/home/home_components.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home';
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (dynamic currentState, dynamic nextState) {
        return currentState.homeAssets.background !=
            nextState.homeAssets.background;
      },
      builder: (context, dynamic state) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(state.homeAssets.background),
              fit: BoxFit.cover,
            ),
          ),
          child: BlocBuilder<SaveBloc, SaveState>(
            builder: (context, state) {
              if (state is SaveInitial) {
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                  _save(context);
                });
              }
              return Scaffold(
                backgroundColor: Colors.transparent,
                extendBodyBehindAppBar: true,
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  actions: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2),
                      child: FloatingActionButton(
                        heroTag: 'shareButton',
                        child: Icon(Icons.share),
                        elevation: 0,
                        onPressed: () {
                          _share(context);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2),
                      child: FloatingActionButton(
                        heroTag: 'infoButton',
                        child: Icon(Icons.info_outline_rounded),
                        elevation: 0,
                        onPressed: () {
                          _info(context);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2),
                      child: FloatingActionButton(
                        heroTag: 'saveButton',
                        child: Icon(Icons.save),
                        elevation: 0,
                        onPressed: () {
                          _save(context);
                        },
                      ),
                    ),
                  ],
                ),
                body: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: MainMenu(),
                ),
              );
            },
          ),
        );
      },
    );
  }

  void _share(BuildContext context) {
    Share.share(
      'Jogo Cultura Paraense https://github.com/Jogo-Cultura-Paraense/Jogo-Cultura-Paraense',
      subject: 'Jogo Cultura Paraense!',
    );
  }

  void _info(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return const InfoAlert();
      },
    );
  }

  void _save(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const SaveAlert();
      },
    );
  }
}
