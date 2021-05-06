import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/gestures.dart';

class GestureBox extends BaseGame with VerticalDragDetector {
  @override
  void onVerticalDragUpdate(DragUpdateDetails d) {
    if (d.delta.dy > 0) {
      print('down');
    } else {
      print('up');
    }
  }
}
