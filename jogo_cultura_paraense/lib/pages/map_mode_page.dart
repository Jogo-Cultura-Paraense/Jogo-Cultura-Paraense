import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jogo_cultura_paraense/bloc/home/home_bloc.dart';
import 'package:jogo_cultura_paraense/bloc/save/save_bloc.dart';
import 'package:jogo_cultura_paraense/components/home/save_alert.dart';

class MapModePage extends StatelessWidget {
  static const String routeName = '/mapmode';
  static ImageProvider<Object> backgroundImage;
  static ImageProvider<Object> mapImage;

  const MapModePage({Key key}) : super(key: key);

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
                        resizeToAvoidBottomInset: false,
                        appBar: AppBar(
                          title: const Text('Mapa'),
                        ),
                      body: Center (
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                width: 275.0,
                                height: 60.0,
                                child: Card(
                                  color: Colors.redAccent[700],
                                  child: Center(
                                    child: Text(
                                      'MESO REGIÕES PARAENSES',
                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                    ), //Text
                                  ), //Center
                                ), //Card
                              ),

                              SizedBox(
                                width: 350.0,
                                height: 400.0,
                                child: Card(
                                  color: Colors.amberAccent,
                                  child: Center(
                                    child: Text(
                                      'MAPAS AQUI',
                                      style: TextStyle(color: Colors.white),
                                    ), //Text
                                  ), //Center
                                ), //Card
                              ),

                              SizedBox(
                                width: 300.0,
                                height: 60.0,
                                child: Card(
                                  color: Colors.redAccent[700],
                                  child: Center(
                                    child: Row (
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget> [
                                        ButtonTheme(
                                          minWidth: 5.0,
                                          buttonColor: Colors.red[700],
                                          child: RaisedButton(
                                            onPressed: () {
                                            },
                                            shape: CircleBorder(),
                                            child: Text('<', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                          ),
                                        ),
                                        Text(
                                          'SELECIONE A MESOREGIÃO',
                                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                        ),
                                        ButtonTheme(
                                          minWidth: 5.0,
                                          buttonColor: Colors.red[700],
                                          child: RaisedButton(
                                            onPressed: () {
                                            },
                                            shape: CircleBorder(),
                                            child: Text('>', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                          ),
                                        )
                                      ]
                                    ) //Text
                                  ), //Center
                                ), //Card
                              ),

                            ]
                        )
                      )
                    );

                  }));
        });
  }
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
