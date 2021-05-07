import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jogo_cultura_paraense/games/cooking_game/models/rules.dart';
import 'package:jogo_cultura_paraense/pages/finished_game_page.dart';
import 'package:jogo_cultura_paraense/games/vocabulario/main_vocabulario.dart';
import 'package:jogo_cultura_paraense/games/running_game/mainLendasMitos.dart';
import 'package:jogo_cultura_paraense/pages/pages.dart';

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
        initialRoute: LoadingPage.routeName,
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
          FinishedGame.routeName: (BuildContext context) {
            return const FinishedGame();
          },
          MainVocabularioScreen.routeName: (BuildContext context) {
            return MainVocabulario();
          },
          ScorePage.routeName: (BuildContext context) {
            return const ScorePage();
          },
          AFFLevelSelectionPage.routeName: (BuildContext context) {
            return const AFFLevelSelectionPage();
          },
          VocabLevelSelectionPage.routeName: (BuildContext context) {
            return const VocabLevelSelectionPage();
          },
          CookingLevelSelectionPage.routeName: (BuildContext context) {
            return const CookingLevelSelectionPage();
          },
          mainLendasMitosScreen.routeName: (BuildContext context) {
            return mainLendasMitos();
          },
        },
        // ignore: missing_return
        onGenerateRoute: (settings) {
          if (settings.name == CookingGamePage.routeName) {
            final CookingGameRules rules = settings.arguments;
            return MaterialPageRoute(
              builder: (context) {
                return CookingGamePage(rules: rules);
              },
            );
          }
        },
      ),
    );
  }
}
