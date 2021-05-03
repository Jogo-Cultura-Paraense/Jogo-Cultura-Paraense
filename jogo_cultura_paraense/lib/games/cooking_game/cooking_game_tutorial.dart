import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jogo_cultura_paraense/games/cooking_game/bloc/cooking_game_bloc.dart';

class CookingGameTutorial extends StatefulWidget {
  const CookingGameTutorial({Key key}) : super(key: key);

  @override
  _CookingGameTutorialState createState() => _CookingGameTutorialState();
}

class _CookingGameTutorialState extends State<CookingGameTutorial> {
  List<String> screens = ['tutorial0', 'tutorial1', 'tutorial2'];
  int currentScreen = 0;

  void nextScreen(BuildContext context) {
    currentScreen += 1;
    if (currentScreen >= screens.length) {
      toGame(context);
    }
  }

  void toGame(BuildContext context) {
    BlocProvider.of<CookingGameBloc>(context).add(StartGame());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          ElevatedButton(
            onPressed: () {
              toGame(context);
            },
            child: Text('Pular'),
            style: ElevatedButton.styleFrom(
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(25.0),
              ),
              primary: Theme.of(context).accentColor,
            ),
          )
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/cooking_game/${screens[currentScreen]}.jpg",
            ),
            fit: BoxFit.fill,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            nextScreen(context);
          });
        },
        label: Text(currentScreen < screens.length - 1 ? 'Próximo' : 'Jogar'),
      ),
    );
  }
}
