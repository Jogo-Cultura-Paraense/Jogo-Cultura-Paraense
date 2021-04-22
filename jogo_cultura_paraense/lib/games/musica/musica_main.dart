import 'package:flame/util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:jogo_cultura_paraense/games/musica/musica_game.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MusicaGame game = MusicaGame();
  TapGestureRecognizer tapper = TapGestureRecognizer();
  tapper.onTapDown = game.onTapDown;
  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);

  runApp(game.widget);
}
