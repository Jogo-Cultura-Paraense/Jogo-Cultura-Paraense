import 'dart:math';
import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';

abstract class RunningSprite extends SpriteComponent {
  final int id;

  RunningSprite(String imagePath) : this.id = Random().nextInt(100) {
    this.sprite = Sprite(imagePath);
  }

  bool contains(Offset d) => this.toRect().contains(d);

  void handleCollision() {}

  void moveTo(double x, double y) {
    this.x = x;
    this.y = y;
  }

  @override
  void render(Canvas canvas) {
    this.sprite.renderRect(canvas, this.toRect());
  }

  @override
  void update(double dt) {
    this.x = x - (400 * dt);
    super.update(dt);
  }
}
