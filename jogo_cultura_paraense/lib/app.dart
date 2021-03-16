import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jogo_cultura_paraense/pages/encyclopedia_page.dart';
import 'package:jogo_cultura_paraense/games/artesanato-fauna-flora/find_game.dart';
import 'package:jogo_cultura_paraense/games/artesanato-fauna-flora/find_game2.dart';
import 'package:jogo_cultura_paraense/games/artesanato-fauna-flora/find_game3.dart';
import 'package:jogo_cultura_paraense/games/artesanato-fauna-flora/find_game4.dart';
import 'package:jogo_cultura_paraense/games/artesanato-fauna-flora/find_game5.dart';
import 'package:jogo_cultura_paraense/games/artesanato-fauna-flora/find_game6.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jogo_cultura_paraense/pages/finished_game_page.dart';
import 'package:jogo_cultura_paraense/pages/score_page.dart';
import 'pages/pages.dart';

class App extends StatelessWidget {
  final SharedPreferences storage;
  final List<BlocProvider> _blocs;
  const App({@required List<BlocProvider> blocs, Key key, this.storage})
      : _blocs = blocs,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: _blocs,
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
          // For dev purposes, should be removed on production
          DevPage.routeName: (BuildContext context) {
            return const DevPage();
          },
          HomePage.routeName: (BuildContext context) {
            return const HomePage();
          },
          LoadingPage.routeName: (BuildContext context) {
            return const LoadingPage();
          },
          EncyclopediaPage.routeName: (BuildContext context) {
            return const EncyclopediaPage();
          },
          GameModePage.routeName: (BuildContext context) {
            return const GameModePage();
          },
          GameSelectionPage.routeName: (BuildContext context) {
            return const GameSelectionPage();
          },
          LevelSelectionPage.routeName: (BuildContext context) {
            return const LevelSelectionPage();
          },
          RegionModePage.routeName: (BuildContext context) {
            return RegionMode();
          },
          SudoestePage.routeName: (BuildContext context) {
            return SudoestePage();
          },
          SudestePage.routeName: (BuildContext context) {
            return SudestePage();
          },
          NordestePage.routeName: (BuildContext context) {
            return NordestePage();
          },
          BaixoAmazonasPage.routeName: (BuildContext context) {
            return BaixoAmazonasPage();
          },
          MetropolitanaPage.routeName: (BuildContext context) {
            return MetropolitanaPage();
          },
          MarajoPage.routeName: (BuildContext context) {
            return MarajoPage();
          },
          FindGame.routeName: (BuildContext context) {
            return FindGame(storage).widget;
          },
          FindGame2.routeName: (BuildContext context) {
            return FindGame2(storage).widget;
          },
          FindGame3.routeName: (BuildContext context) {
            return FindGame3(storage).widget;
          },
          FindGame4.routeName: (BuildContext context) {
            return FindGame4(storage).widget;
          },
          FinishedGame.routeName: (BuildContext context) {
            return const FinishedGame();
          },
          ScorePage.routeName: (BuildContext context) {
            return const ScorePage();
          },
        },
        initialRoute: LoadingPage.routeName,
      ),
    );
  }
}
