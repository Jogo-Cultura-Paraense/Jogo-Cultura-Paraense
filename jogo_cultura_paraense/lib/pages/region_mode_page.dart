import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jogo_cultura_paraense/bloc/save/save_bloc.dart';
import 'package:jogo_cultura_paraense/components/home/home_scaffold.dart';
import 'package:jogo_cultura_paraense/components/save/save_selection.dart';

class RegionMode extends StatefulWidget {
  RegionModePage createState() => RegionModePage();
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
    return HomeScaffold(
      appBar: AppBar(
        title: const Text('Mapa'),
      ),
      body: SaveSelection(
        child: Center(
          child: BlocBuilder<SaveBloc, SaveState>(
            buildWhen: (previousState, currentState) {
              if (previousState.currentSave != currentState.currentSave) {
                return true;
              }
              return false;
            },
            builder: (context, state) {
              mapSave = state.currentSave.getMapSave(regionName).isOpen;
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  SizedBox(
                    width: 275.0,
                    height: 60.0,
                    child: Card(
                      color: Colors.redAccent[700],
                      child: Center(
                        child: Text(
                          'MESO REGIÕES PARAENSES',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ), //Text
                      ), //Center
                    ), //Card
                  ),
                  Visibility(
                    visible: mapSave,
                    child: GestureDetector(
                      onTap: () {
                        goToLevel();
                      },
                      child: SizedBox(
                        width: 350.0,
                        height: 400.0,
                        child: Card(
                          color: Colors.amber[200],
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: mapImage,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ), //Card
                      ),
                    ),
                  ),
                  Visibility(
                    visible: mapSave == false,
                    child: GestureDetector(
                      onTap: () {
                        goToLevel();
                      },
                      child: SizedBox(
                        width: 350.0,
                        height: 400.0,
                        child: Card(
                          color: Colors.amber[200],
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                colorFilter: ColorFilter.mode(
                                    Colors.black87.withOpacity(0.1),
                                    BlendMode.dstATop),
                                image: mapImage,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ), //Card
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 300.0,
                    height: 60.0,
                    child: Card(
                      color: Colors.redAccent[700],
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Visibility(
                              visible: counter != 0,
                              child: ButtonTheme(
                                minWidth: 5.0,
                                buttonColor: Colors.red[700],
                                child: ElevatedButton(
                                  onPressed: () {
                                    passLeft();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: CircleBorder(),
                                  ),
                                  child: Text(
                                    '<',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              bottomText,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Visibility(
                              visible: counter != 6,
                              child: ButtonTheme(
                                minWidth: 5.0,
                                buttonColor: Colors.red[700],
                                child: ElevatedButton(
                                  onPressed: () {
                                    passRight();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: CircleBorder(),
                                  ),
                                  child: Text(
                                    '>',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ), //Text
                      ), //Center
                    ), //Card
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
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

  void passLeft() {
    this.counter = this.counter - 1;
    selectMap();
  }

  void passRight() {
    this.counter = this.counter + 1;
    selectMap();
  }

  void goToLevel() {
    if (this.counter == 0) {
    } else if (this.counter == 1 && this.mapSave) {
      Navigator.of(context).pushNamed('/sudoeste');
    } else if (this.counter == 2 && this.mapSave) {
      Navigator.of(context).pushNamed('/baixo_amazonas');
    } else if (this.counter == 3 && this.mapSave) {
      Navigator.of(context).pushNamed('/sudeste');
    } else if (this.counter == 4 && this.mapSave) {
      Navigator.of(context).pushNamed('/nordeste');
    } else if (this.counter == 5 && this.mapSave) {
      Navigator.of(context).pushNamed('/marajo');
    } else if (this.counter == 6 && this.mapSave) {
      Navigator.of(context).pushNamed('/metropolitana');
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            backgroundColor: Color.fromRGBO(233, 10, 10, 1),
            content: Text(
              'Você ainda não habilitou esse mapa. Conclua os mapas anteriores!',
              textAlign: TextAlign.center,
            ),
          );
        },
      );
    }
  }
}
