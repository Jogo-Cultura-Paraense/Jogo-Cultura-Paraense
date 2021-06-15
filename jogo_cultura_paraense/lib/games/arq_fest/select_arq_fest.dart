import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/games/arq_fest/main_arq_fest.dart';

class SelectArqFest extends StatelessWidget {

  static const String routeName = '/SelectArqFest';

  int level;

  @override
  Widget build(BuildContext context) {
    level = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center (
        child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text (
                'Selecione o tipo de imagem que você deseja montar: \n',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20.0
                )
            ),
            RaisedButton(
                onPressed: () => {
                  goToArchitecture(level, context)
                },
              color: Colors.amber,
              child: Text (
                  'Arquitetura',
                  style: TextStyle(
                    fontSize: 20.0
                  )
              )
            ),
            RaisedButton(
                onPressed: () => {
                  goToFestivities(level, context)
                },
              color: Colors.amber,
                child: Text (
                    'Festividades',
                    style: TextStyle(
                        fontSize: 20.0
                    )
                )
            )
          ],
        ),
      )
    );
  }


  void goToArchitecture(int level, BuildContext context) {
    if (level == 1) {
      Navigator.of(context).pushNamed(
          MainArqFestScreen.routeName,
          arguments: {
            'images': ['lib/images/arq/1/row-1-col-1.png', 'lib/images/arq/1/row-1-col-2.png', 'lib/images/arq/1/row-1-col-3.png',
              'lib/images/arq/1/row-2-col-1.png', 'lib/images/arq/1/row-2-col-2.png', 'lib/images/arq/1/row-2-col-3.png',
              'lib/images/arq/1/row-3-col-1.png', 'lib/images/arq/1/row-3-col-2.png', 'lib/images/arq/1/row-3-col-3.png',
              'lib/images/arq/1/row-4-col-1.png', 'lib/images/arq/1/row-4-col-2.png', 'lib/images/arq/1/row-4-col-3.png',
              'lib/images/arq/1/row-5-col-1.png', 'lib/images/arq/1/row-5-col-2.png', 'lib/images/arq/1/row-5-col-3.png'],
            'time': ['300'],
            'level': ['1']
          }
      );
    } else if (level == 2) {
      Navigator.of(context).pushNamed(
          MainArqFestScreen.routeName,
          arguments: {
            'images': ['lib/images/arq/2/row-1-col-1.png', 'lib/images/arq/2/row-1-col-2.png', 'lib/images/arq/2/row-1-col-3.png',
              'lib/images/arq/2/row-2-col-1.png', 'lib/images/arq/2/row-2-col-2.png', 'lib/images/arq/2/row-2-col-3.png',
              'lib/images/arq/2/row-3-col-1.png', 'lib/images/arq/2/row-3-col-2.png', 'lib/images/arq/2/row-3-col-3.png',
              'lib/images/arq/2/row-4-col-1.png', 'lib/images/arq/2/row-4-col-2.png', 'lib/images/arq/2/row-4-col-3.png',
              'lib/images/arq/2/row-5-col-1.png', 'lib/images/arq/2/row-5-col-2.png', 'lib/images/arq/2/row-5-col-3.png'],
            'time': ['270'],
            'level': ['2']
          }
      );
    } else if (level == 3) {
      Navigator.of(context).pushNamed(
          MainArqFestScreen.routeName,
          arguments: {
            'images': ['lib/images/arq/3/row-1-col-1.png', 'lib/images/arq/3/row-1-col-2.png', 'lib/images/arq/3/row-1-col-3.png',
              'lib/images/arq/3/row-2-col-1.png', 'lib/images/arq/3/row-2-col-2.png', 'lib/images/arq/3/row-2-col-3.png',
              'lib/images/arq/3/row-3-col-1.png', 'lib/images/arq/3/row-3-col-2.png', 'lib/images/arq/3/row-3-col-3.png',
              'lib/images/arq/3/row-4-col-1.png', 'lib/images/arq/3/row-4-col-2.png', 'lib/images/arq/3/row-4-col-3.png',
              'lib/images/arq/3/row-5-col-1.png', 'lib/images/arq/3/row-5-col-2.png', 'lib/images/arq/3/row-5-col-3.png'],
            'time': ['240'],
            'level': ['3']
          }
      );
    } else if (level == 4) {
      Navigator.of(context).pushNamed(
          MainArqFestScreen.routeName,
          arguments: {
            'images': ['lib/images/arq/4/row-1-col-1.png', 'lib/images/arq/4/row-1-col-2.png', 'lib/images/arq/4/row-1-col-3.png',
              'lib/images/arq/4/row-2-col-1.png', 'lib/images/arq/4/row-2-col-2.png', 'lib/images/arq/4/row-2-col-3.png',
              'lib/images/arq/4/row-3-col-1.png', 'lib/images/arq/4/row-3-col-2.png', 'lib/images/arq/4/row-3-col-3.png',
              'lib/images/arq/4/row-4-col-1.png', 'lib/images/arq/4/row-4-col-2.png', 'lib/images/arq/4/row-4-col-3.png',
              'lib/images/arq/4/row-5-col-1.png', 'lib/images/arq/4/row-5-col-2.png', 'lib/images/arq/4/row-5-col-3.png'],
            'time': ['210'],
            'level': ['4']
          }
      );
    } else if (level == 5) {
      Navigator.of(context).pushNamed(
          MainArqFestScreen.routeName,
          arguments: {
            'images': ['lib/images/arq/5/row-1-col-1.png', 'lib/images/arq/5/row-1-col-2.png', 'lib/images/arq/5/row-1-col-3.png',
              'lib/images/arq/5/row-2-col-1.png', 'lib/images/arq/5/row-2-col-2.png', 'lib/images/arq/5/row-2-col-3.png',
              'lib/images/arq/5/row-3-col-1.png', 'lib/images/arq/5/row-3-col-2.png', 'lib/images/arq/5/row-3-col-3.png',
              'lib/images/arq/5/row-4-col-1.png', 'lib/images/arq/5/row-4-col-2.png', 'lib/images/arq/5/row-4-col-3.png',
              'lib/images/arq/5/row-5-col-1.png', 'lib/images/arq/5/row-5-col-2.png', 'lib/images/arq/5/row-5-col-3.png'],
            'time': ['180'],
            'level': ['5']
          }
      );
    } else if (level == 6) {
      Navigator.of(context).pushNamed(
          MainArqFestScreen.routeName,
          arguments: {
            'images': ['lib/images/arq/6/row-1-col-1.png', 'lib/images/arq/6/row-1-col-2.png', 'lib/images/arq/6/row-1-col-3.png',
              'lib/images/arq/6/row-2-col-1.png', 'lib/images/arq/6/row-2-col-2.png', 'lib/images/arq/6/row-2-col-3.png',
              'lib/images/arq/6/row-3-col-1.png', 'lib/images/arq/6/row-3-col-2.png', 'lib/images/arq/6/row-3-col-3.png',
              'lib/images/arq/6/row-4-col-1.png', 'lib/images/arq/6/row-4-col-2.png', 'lib/images/arq/6/row-4-col-3.png',
              'lib/images/arq/6/row-5-col-1.png', 'lib/images/arq/6/row-5-col-2.png', 'lib/images/arq/6/row-5-col-3.png'],
            'time': ['150'],
            'level': ['6']
          }
      );

    }
  }

  void goToFestivities(int level, BuildContext context) {
    if (level == 1) {
      Navigator.of(context).pushNamed(
          MainArqFestScreen.routeName,
          arguments: {
            'images': ['lib/images/fest/1/row-1-col-1.png', 'lib/images/fest/1/row-1-col-2.png', 'lib/images/fest/1/row-1-col-3.png',
              'lib/images/fest/1/row-2-col-1.png', 'lib/images/fest/1/row-2-col-2.png', 'lib/images/fest/1/row-2-col-3.png',
              'lib/images/fest/1/row-3-col-1.png', 'lib/images/fest/1/row-3-col-2.png', 'lib/images/fest/1/row-3-col-3.png',
              'lib/images/fest/1/row-4-col-1.png', 'lib/images/fest/1/row-4-col-2.png', 'lib/images/fest/1/row-4-col-3.png',
              'lib/images/fest/1/row-5-col-1.png', 'lib/images/fest/1/row-5-col-2.png', 'lib/images/fest/1/row-5-col-3.png'],
            'time': ['300'],
            'level': ['1']
          }
      );
    } else if (level == 2) {
      Navigator.of(context).pushNamed(
      MainArqFestScreen.routeName,
      arguments: {
      'images': ['lib/images/fest/2/row-1-col-1.png', 'lib/images/fest/2/row-1-col-2.png', 'lib/images/fest/2/row-1-col-3.png',
      'lib/images/fest/2/row-2-col-1.png', 'lib/images/fest/2/row-2-col-2.png', 'lib/images/fest/2/row-2-col-3.png',
      'lib/images/fest/2/row-3-col-1.png', 'lib/images/fest/2/row-3-col-2.png', 'lib/images/fest/2/row-3-col-3.png',
      'lib/images/fest/2/row-4-col-1.png', 'lib/images/fest/2/row-4-col-2.png', 'lib/images/fest/2/row-4-col-3.png',
      'lib/images/fest/2/row-5-col-1.png', 'lib/images/fest/2/row-5-col-2.png', 'lib/images/fest/2/row-5-col-3.png'],
      'time': ['270'],
      'level': ['2']
          }
      );
    } else if (level == 3) {
      Navigator.of(context).pushNamed(
          MainArqFestScreen.routeName,
          arguments: {
            'images': ['lib/images/fest/3/row-1-col-1.png', 'lib/images/fest/3/row-1-col-2.png', 'lib/images/fest/3/row-1-col-3.png',
              'lib/images/fest/3/row-2-col-1.png', 'lib/images/fest/3/row-2-col-2.png', 'lib/images/fest/3/row-2-col-3.png',
              'lib/images/fest/3/row-3-col-1.png', 'lib/images/fest/3/row-3-col-2.png', 'lib/images/fest/3/row-3-col-3.png',
              'lib/images/fest/3/row-4-col-1.png', 'lib/images/fest/3/row-4-col-2.png', 'lib/images/fest/3/row-4-col-3.png',
              'lib/images/fest/3/row-5-col-1.png', 'lib/images/fest/3/row-5-col-2.png', 'lib/images/fest/3/row-5-col-3.png'],
            'time': ['240'],
            'level': ['3']
          }
      );
    } else if (level == 4) {
      Navigator.of(context).pushNamed(
          MainArqFestScreen.routeName,
          arguments: {
            'images': ['lib/images/fest/4/row-1-col-1.png', 'lib/images/fest/4/row-1-col-2.png', 'lib/images/fest/4/row-1-col-3.png',
              'lib/images/fest/4/row-2-col-1.png', 'lib/images/fest/4/row-2-col-2.png', 'lib/images/fest/4/row-2-col-3.png',
              'lib/images/fest/4/row-3-col-1.png', 'lib/images/fest/4/row-3-col-2.png', 'lib/images/fest/4/row-3-col-3.png',
              'lib/images/fest/4/row-4-col-1.png', 'lib/images/fest/4/row-4-col-2.png', 'lib/images/fest/4/row-4-col-3.png',
              'lib/images/fest/4/row-5-col-1.png', 'lib/images/fest/4/row-5-col-2.png', 'lib/images/fest/4/row-5-col-3.png'],
            'time': ['210'],
            'level': ['4']
          }
      );
    } else if (level == 5) {
      Navigator.of(context).pushNamed(
          MainArqFestScreen.routeName,
          arguments: {
            'images': ['lib/images/fest/5/row-1-col-1.png', 'lib/images/fest/5/row-1-col-2.png', 'lib/images/fest/5/row-1-col-3.png',
              'lib/images/fest/5/row-2-col-1.png', 'lib/images/fest/5/row-2-col-2.png', 'lib/images/fest/5/row-2-col-3.png',
              'lib/images/fest/5/row-3-col-1.png', 'lib/images/fest/5/row-3-col-2.png', 'lib/images/fest/5/row-3-col-3.png',
              'lib/images/fest/5/row-4-col-1.png', 'lib/images/fest/5/row-4-col-2.png', 'lib/images/fest/5/row-4-col-3.png',
              'lib/images/fest/5/row-5-col-1.png', 'lib/images/fest/5/row-5-col-2.png', 'lib/images/fest/5/row-5-col-3.png'],
            'time': ['180'],
            'level': ['5']
          }
      );
    } else if (level == 6) {
      Navigator.of(context).pushNamed(
          MainArqFestScreen.routeName,
          arguments: {
            'images': ['lib/images/fest/6/row-1-col-1.png', 'lib/images/fest/6/row-1-col-2.png', 'lib/images/fest/6/row-1-col-3.png',
              'lib/images/fest/6/row-2-col-1.png', 'lib/images/fest/6/row-2-col-2.png', 'lib/images/fest/6/row-2-col-3.png',
              'lib/images/fest/6/row-3-col-1.png', 'lib/images/fest/6/row-3-col-2.png', 'lib/images/fest/6/row-3-col-3.png',
              'lib/images/fest/6/row-4-col-1.png', 'lib/images/fest/6/row-4-col-2.png', 'lib/images/fest/6/row-4-col-3.png',
              'lib/images/fest/6/row-5-col-1.png', 'lib/images/fest/6/row-5-col-2.png', 'lib/images/fest/6/row-5-col-3.png'],
            'time': ['150'],
            'level': ['6']
          }
      );

    }

  }

}