import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jogo_cultura_paraense/bloc/home/home_bloc.dart';
import 'package:jogo_cultura_paraense/bloc/save/save_bloc.dart';
import 'package:jogo_cultura_paraense/components/home/save_alert.dart';
import 'package:share/share.dart';

import 'info_alert.dart';

class MenuAppBar extends StatelessWidget {
  final Widget bodyWidget;
  static ImageProvider<Object> backgroundImage;

  const MenuAppBar({
    Key key,
    this.bodyWidget,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (dynamic currentState, dynamic nextState) {
        return currentState.homeAssets.background !=
            nextState.homeAssets.background;
      },
      builder: (context, dynamic state) {
        backgroundImage = NetworkImage(state.homeAssets.background);
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: backgroundImage,
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
                  child: bodyWidget,
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class HomeAppBarButton extends StatelessWidget {
  final String heroTag;
  final IconData iconData;
  final Function onPressed;

  const HomeAppBarButton({
    Key key,
    this.heroTag,
    this.iconData,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2),
      child: FloatingActionButton(
        heroTag: heroTag,
        child: Icon(iconData),
        elevation: 0,
        onPressed: () => onPressed,
      ),
    );
  }
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