import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jogo_cultura_paraense/bloc/save/save_bloc.dart';
import 'package:jogo_cultura_paraense/components/home/info_alert.dart';
import 'package:jogo_cultura_paraense/components/home/save_alert.dart';
import 'package:share/share.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  HomeAppBar({Key key})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _HomeAppBarState createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
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
        BlocBuilder<SaveBloc, SaveState>(
          builder: (context, state) {
            if (state is SaveInitial) {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                _save(context);
              });
            }
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 2),
              child: FloatingActionButton(
                heroTag: 'saveButton',
                child: Icon(Icons.save),
                elevation: 0,
                onPressed: () {
                  _save(context);
                },
              ),
            );
          },
        ),
      ],
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
