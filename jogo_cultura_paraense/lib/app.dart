import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jogo_cultura_paraense/bloc/home/home_bloc.dart';
import 'package:jogo_cultura_paraense/bloc/save/save_bloc.dart';
import 'package:jogo_cultura_paraense/games/artesanato-fauna-flora/find_game.dart';
import 'package:jogo_cultura_paraense/pages/game_mode_page.dart';
import 'package:jogo_cultura_paraense/pages/map_mode_page.dart';
import 'package:jogo_cultura_paraense/pages/select_level.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/pages.dart';

class App extends StatelessWidget {
  final SharedPreferences storage;
  const App({Key key, this.storage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider>[
        BlocProvider<HomeBloc>(create: (BuildContext context) => HomeBloc()),
        BlocProvider<SaveBloc>(create: (BuildContext context) => SaveBloc()),
      ],
      child: MaterialApp(
        title: 'Jogo Cultura Paraense',
        theme: ThemeData(
          primaryColor: Colors.red[900],
          accentColor: Colors.redAccent[700],
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.redAccent[700],
            textTheme: ButtonTextTheme.primary,
          ),
        ),
        routes: {
          HomePage.routeName: (BuildContext context) {
            return const HomePage();
          },
          LoadingPage.routeName: (BuildContext context) {
            return const LoadingPage();
          },
          EnciclopediaPage.routeName: (BuildContext context) {
            return const EnciclopediaPage();
          },
          GameModePage.routeName: (BuildContext context) {
            return const GameModePage();
          },
          MapModePage.routeName: (BuildContext context) {
            return const MapModePage();
          },
          GameSelectPage.routeName: (BuildContext context) {
            return const GameSelectPage();
          },
          LevelSelection.routeName: (BuildContext context) {
            return const LevelSelection();
          },
          FindGame.routeName: (BuildContext context) {
            return FindGame(storage).widget;
          },
        },
        initialRoute: LoadingPage.routeName,
      ),
    );
  }
}
