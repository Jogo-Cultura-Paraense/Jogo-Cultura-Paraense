import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/games/artesanato-fauna-flora/find_game.dart';
import 'app.dart';

import 'package:flame/util.dart';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
// configura o jogo para tela cheia e trava no modo retrato
  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);

  SharedPreferences storage = await SharedPreferences.getInstance();

  FindGame game = FindGame(storage);
  //runApp(game.widget);

  TapGestureRecognizer tapper = TapGestureRecognizer();
  tapper.onTapDown = game.onTapDown;
  // ignore: deprecated_member_use
  flameUtil.addGestureRecognizer(tapper);

  runApp(App(storage: storage));
}
