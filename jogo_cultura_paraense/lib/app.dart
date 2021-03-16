import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jogo_cultura_paraense/pages/encyclopedia_page.dart';
import 'package:jogo_cultura_paraense/pages/games/art_fauna_flora.dart';
import 'package:jogo_cultura_paraense/pages/finished_game_page.dart';
import 'package:jogo_cultura_paraense/pages/score_page.dart';
import 'pages/pages.dart';

class App extends StatelessWidget {
  final List<BlocProvider> _blocs;
  const App({@required List<BlocProvider> blocs, Key key})
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
          ArtFaunaFloraGamePage.routeName: (BuildContext context) {
            return const ArtFaunaFloraGamePage();
          },
          ArtFaunaFloraGamePage2.routeName: (BuildContext context) {
            return const ArtFaunaFloraGamePage2();
          },
          ArtFaunaFloraGamePage3.routeName: (BuildContext context) {
            return const ArtFaunaFloraGamePage3();
          },
          ArtFaunaFloraGamePage4.routeName: (BuildContext context) {
            return const ArtFaunaFloraGamePage4();
          },
          ArtFaunaFloraGamePage5.routeName: (BuildContext context) {
            return const ArtFaunaFloraGamePage5();
          },
          ArtFaunaFloraGamePage6.routeName: (BuildContext context) {
            return const ArtFaunaFloraGamePage6();
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
