import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flame/util.dart';
import 'package:jogo_cultura_paraense/bloc/bloc.dart';
import 'package:jogo_cultura_paraense/repositories/repositories.dart';
import 'package:jogo_cultura_paraense/services/services.dart';
import 'package:jogo_cultura_paraense/games/artesanato-fauna-flora/find_game.dart';
import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app.dart';

void main() async {
  // Repositories
  final datoCMSRepository = DatoCMSRepository();
  final appDataRepository = AppDataRepository();

  // Services
  final encyclopediaService = EncyclopediaService(datoCMSRepository);
  final homeAssetsService = HomeAssetsService(datoCMSRepository);
  final mapAssetsService = MapAssetsService(datoCMSRepository);

  // Blocs
  final blocProviders = <BlocProvider>[
    BlocProvider<HomeBloc>(create: (BuildContext context) {
      return HomeBloc(homeAssetsService);
    }),
    BlocProvider<SaveBloc>(create: (BuildContext context) {
      return SaveBloc(appDataRepository);
    }),
    BlocProvider<MapBloc>(create: (BuildContext context) {
      return MapBloc(mapAssetsService);
    }),
    BlocProvider<EncyclopediaBloc>(create: (BuildContext context) {
      return EncyclopediaBloc(encyclopediaService);
    }),
  ];

  WidgetsFlutterBinding.ensureInitialized();
// configura o jogo para tela cheia e trava no modo retrato
  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);

  SharedPreferences storage = await SharedPreferences.getInstance();

  FindGame game = FindGame();
  //runApp(game.widget);

  TapGestureRecognizer tapper = TapGestureRecognizer();
  tapper.onTapDown = game.onTapDown;
  // ignore: deprecated_member_use
  flameUtil.addGestureRecognizer(tapper);

  runApp(App(blocs: blocProviders, storage: storage));
}
