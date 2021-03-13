import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jogo_cultura_paraense/bloc/save/save_bloc.dart';
import 'package:jogo_cultura_paraense/pages/home_page.dart';


class ScorePage extends StatelessWidget {
  static const String routeName = '/scorePage';
  const ScorePage({Key key}) : super(key: key);

  @override
  Widget build (BuildContext context) {
    return Scaffold(

        backgroundColor: Colors.red,
        body: Center (
            child: Column (
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget> [
                SafeArea(child:  Container (
                  width: 60,
                  height: 60,
                  child: Icon (
                      Icons.lock_open_rounded ,
                      size: 40.0
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[600],),
                ),
                ),

                Padding(
                    padding: const EdgeInsets.only(bottom: 35.0),
                    child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: 300,
                          maxWidth: 300,
                        ),
                        child: Container (

                            color: Colors.grey[600],
                            child: Text(

                              '\nNovas Palavras Desbloqueadas na Enciclopédia Papa Chibé. Clique aqui para abrir a Enciclopédia.\n',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white
                              ),
                            )
                        )
                    )
                ),
                Container (
                  width: 60,
                  height: 60,
                  child: Icon (
                      Icons.star,
                      size: 45.0
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[600],),
                ),
                Padding(
                    padding: const EdgeInsets.only(bottom: 50.0),
                    child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: 300,
                          maxWidth: 300,
                        ),
                        child: Container (
                            color: Colors.grey[600],
                            child: Text(
                              '\nPONTUAÇÃO: \n\nJogo Concluído: \t\t\t\t 1000pts  \nTempo Restante: \t\t\t\t 12 segundos \nDicas Usadas: \t\t\t\t -0\nTotal de Dicas: \t\t\t\t x2\n\n TOTAL: 1800 / 2000 \n',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.yellow
                              ),
                            )
                        )
                    )
                ),

                Row(
                    children: <Widget> [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30.0, left: 10.0),
                        child: Icon (
                            Icons.person,
                            color: Colors.black,
                            size: 130.0
                        ),
                      ),
                      Padding (
                        padding: const EdgeInsets.only(bottom: 100.0),
                        child: Container(
                            child: Text (
                              "\n PAI D'ÉGUA!!!  \n",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.white
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[600]
                            )
                        ),
                      ),



                      Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: RaisedButton(
                              color: Colors.grey[600],
                              onPressed: () => _pass(context),

                              child:  Icon (
                                Icons.arrow_forward_rounded,
                                color: Colors.black,
                                size: 45.0,
                              )
                          )
                      ),
                    ]
                )




              ],
            )
        )
    );
  }

  void _pass(BuildContext context) {
    //print(checkTime());
    Navigator.of(context).pushNamed(HomePage.routeName);
  }


}