import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jogo_cultura_paraense/bloc/home/home_bloc.dart';
import 'package:jogo_cultura_paraense/bloc/save/save_bloc.dart';
import 'package:jogo_cultura_paraense/components/home/save_alert.dart';

class RegionMode extends StatefulWidget{
  RegionModePage createState()=> RegionModePage();
}

class RegionModePage extends State<RegionMode> {
  static const String routeName = '/mapmode';
  static ImageProvider<Object> backgroundImage;
  String bottomText = "SELECIONE A MESOREGIÃO";
  String regionName = 'Sudoeste';
  ImageProvider<Object> mapImage = AssetImage("lib/images/mesoregioes.png");
  int counter = 0;
  bool mapSave;


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
                    mapSave = state.currentSave.getMapSave(regionName).isOpen;
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
                                  GestureDetector(
                                    onTap: () {goToLevel();},
                                    child:
                                  SizedBox(
                                    width: 350.0,
                                    height: 400.0,
                                    child: Card(
                                      color: Colors.amber,
                                      child: Container(

                                          decoration: BoxDecoration(

                                              image:  DecorationImage(

                                                  image: mapImage,
                                                  fit: BoxFit.cover

                                              )
                                          )
                                      ),
                                    ), //Card
                                  ),),


                                  SizedBox(
                                    width: 300.0,
                                    height: 60.0,
                                    child: Card(
                                      color: Colors.redAccent[700],
                                      child: Center(
                                          child: Row (
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget> [
                                                Visibility(
                                                    visible: counter != 0,
                                                    child: ButtonTheme(
                                                  minWidth: 5.0,
                                                  buttonColor: Colors.red[700],
                                                  child: RaisedButton(
                                                    onPressed: () {
                                                      passLeft();
                                                    },
                                                    shape: CircleBorder(),
                                                    child: Text('<', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                                  ),
                                                )
                                                ),
                                                Text(
                                                  bottomText,
                                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                                ),
                                                Visibility(
                                                    visible: counter != 6,
                                                    child: ButtonTheme(
                                                  minWidth: 5.0,
                                                  buttonColor: Colors.red[700],
                                                  child: RaisedButton(
                                                    onPressed: () {
                                                      passRight();
                                                    },
                                                    shape: CircleBorder(),
                                                    child: Text('>', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                                  ),
                                                ))

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

  bool showPassRight() {
    if (this.counter == 0) {
      return false;
    } else {
      return true;
    }
  }

  void selectMap() {
    if (this.counter == 0) {
      setState(() {
        this.bottomText = 'SELECIONE A MESOREGIÃO';
        this.mapImage = AssetImage("lib/images/mesoregioes.png");
      });
    } else if (this.counter == 1) {
      setState(() {
        this.bottomText = 'SUDOESTE PARAENSE';
        this.regionName = 'Sudoeste';
        this.mapImage = AssetImage("lib/images/sudoesteparaense.png");
      });
    } else if (this.counter == 2) {
      setState(() {
        this.bottomText = 'BAIXO AMAZONAS';
        this.regionName = 'Baixo Amazonas';
        this.mapImage = AssetImage("lib/images/baixoamazonas.png");
      });
    } else if (this.counter == 3) {
      setState(() {
        this.bottomText = 'SUDESTE PARAENSE';
        this.regionName = 'Sudeste';
        this.mapImage = AssetImage("lib/images/sudesteparaense.png");
      });
    } else if (this.counter == 4) {
      setState(() {
        this.bottomText = 'NORDESTE PARAENSE';
        this.regionName = 'Nordeste';
        this.mapImage = AssetImage("lib/images/nordesteparaense.png");
      });
    } else if (this.counter == 5) {
      setState(() {
        this.bottomText = 'MARAJÓ';
        this.regionName = 'Marajó';
        this.mapImage = AssetImage("lib/images/marajo.png");
      });
    } else if (this.counter == 6) {
      setState(() {
        this.regionName = 'Metropolitana';
        this.bottomText = 'METROPOLITANA DE BELÉM';
        this.mapImage = AssetImage("lib/images/metropolitana.png");
      });
    }
  }

  String passLeft() {
    this.counter = this.counter - 1;
    print(this.counter);
    selectMap();

  }

  String passRight() {
    this.counter = this.counter + 1;
    print(this.counter);
    selectMap();
  }

  void goToLevel() {
    print(this.mapSave);
    if (this.counter == 1 ) {
      Navigator.of(context).pushNamed('/sudoeste');
    } else if (this.counter == 2 ) {
      Navigator.of(context).pushNamed('/baixo_amazonas');
    } else if (this.counter == 3) {
      Navigator.of(context).pushNamed('/sudeste');
    } else if (this.counter == 4) {
      Navigator.of(context).pushNamed('/nordeste');
    } else if (this.counter == 5) {
      Navigator.of(context).pushNamed('/marajo');
    } else if (this.counter == 6) {
      Navigator.of(context).pushNamed('/metropolitana');
    }
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