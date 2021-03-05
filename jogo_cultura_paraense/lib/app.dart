import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jogo_cultura_paraense/pages/dev.dart';
import 'package:jogo_cultura_paraense/pages/maps/maps.dart';
import 'package:jogo_cultura_paraense/pages/game_mode_page.dart';
import 'package:jogo_cultura_paraense/pages/region_mode_page.dart';
import 'package:jogo_cultura_paraense/pages/select_level.dart';
import 'pages/pages.dart';

class App extends StatelessWidget {
  final List<BlocProvider> _blocs;

  const App({@required List<BlocProvider> blocs}) : _blocs = blocs;

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
          EnciclopediaPage.routeName: (BuildContext context) {
            return const EnciclopediaPage();
          },
          GameModePage.routeName: (BuildContext context) {
            return const GameModePage();
          },
          GameSelectPage.routeName: (BuildContext context) {
            return const GameSelectPage();
          },
          LevelSelection.routeName: (BuildContext context) {
            return const LevelSelection();
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
        },
        initialRoute: LoadingPage.routeName,
      ),
    );
  }
}
