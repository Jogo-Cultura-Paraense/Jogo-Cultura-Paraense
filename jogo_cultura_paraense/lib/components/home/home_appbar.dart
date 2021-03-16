import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/components/home/info_alert.dart';
import 'package:jogo_cultura_paraense/components/save/save_selection.dart';
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
        SaveSelection(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2),
            child: FloatingActionButton(
              heroTag: 'saveButton',
              child: Icon(Icons.save),
              elevation: 0,
              onPressed: () {
                SaveSelection.show(context);
              },
            ),
          ),
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
}
