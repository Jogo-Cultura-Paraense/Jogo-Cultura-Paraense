import 'dart:math';
import 'dart:ui';

import 'package:flame/components/component.dart';

abstract class RunningSprite extends SpriteComponent {
  final int id;
  final Color color;

  RunningSprite(String imagePath)
      : this.id = Random().nextInt(100),
        this.color = Color(int.parse(imagePath));

  bool contains(Offset d) => this.toRect().contains(d);

  void handleCollision() {}

  void moveTo(double x, double y) {
    this.x = x;
    this.y = y;
  }

  @override
  void render(Canvas canvas) {
    final paint = Paint();
    paint.color = this.color;
    canvas.drawRect(this.toRect(), paint);
  }

  @override
  void update(double dt) {
    this.x = x - (400 * dt);
    super.update(dt);
  }
}