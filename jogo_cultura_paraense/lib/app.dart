import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jogo_cultura_paraense/bloc/encyclopedia/encyclopedia_bloc.dart';
import 'package:jogo_cultura_paraense/bloc/home/home_bloc.dart';
import 'package:jogo_cultura_paraense/bloc/map/map_bloc.dart';
import 'package:jogo_cultura_paraense/bloc/save/save_bloc.dart';
import 'package:jogo_cultura_paraense/pages/maps/maps.dart';
import 'package:jogo_cultura_paraense/pages/game_mode_page.dart';
import 'package:jogo_cultura_paraense/pages/region_mode_page.dart';
import 'package:jogo_cultura_paraense/pages/select_level.dart';
import 'package:jogo_cultura_paraense/repositories/datocms_repository.dart';
import 'package:jogo_cultura_paraense/services/encyclopedia_service.dart';
import 'pages/pages.dart';

final _datoCMSRepository = DatoCMSRepository();
final _encyclopediaService = EncyclopediaService(_datoCMSRepository);

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider>[
        BlocProvider<HomeBloc>(create: (BuildContext context) => HomeBloc()),
        BlocProvider<SaveBloc>(create: (BuildContext context) => SaveBloc()),
        BlocProvider<MapBloc>(create: (BuildContext context) => MapBloc()),
        BlocProvider<EncyclopediaBloc>(
          create: (BuildContext context) {
            return EncyclopediaBloc(_encyclopediaService);
          },
        ),
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
