import 'package:flame/util.dart';
import 'find_game.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flame/flame.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
// configura o jogo para tela cheia e trava no modo retrato
  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);

  Flame.images.loadAll(<String>[
    'findGame/background.jpg',
    'findGame/00.png',
    'findGame/01.png',
    'findGame/02.png',
    'findGame/03.png',
    'findGame/04.png',
    'findGame/05.png',
    'findGame/06.png',
    'findGame/07.png',
    'findGame/08.png',
    'findGame/09.png',
    'findGame/start_button.png',
    'findGame/no_button.png',
    'findGame/hint_button.png',
    'findGame/how_to.png',
    'findGame/end_game.png',
  ]);

  SharedPreferences storage = await SharedPreferences.getInstance();

  FindGame game = FindGame(storage);
  runApp(game.widget);

  TapGestureRecognizer tapper = TapGestureRecognizer();
  tapper.onTapDown = game.onTapDown;
  flameUtil.addGestureRecognizer(tapper);
}
