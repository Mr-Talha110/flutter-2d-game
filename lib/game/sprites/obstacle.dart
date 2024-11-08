import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:gameproject/constants.dart';
import 'package:gameproject/game/go_green_game.dart';

class Obstacle extends SpriteComponent
    with HasGameRef<GoGreenGame>, CollisionCallbacks {
  Obstacle({
    required this.spritePath,
  });

  final String spritePath;

  @override
  FutureOr<void> onLoad() async {
    sprite = await Sprite.load(spritePath);
    size = Vector2.all(obstacleSize);
    anchor = Anchor.center;
    add(CircleHitbox());
  }
}

class ObstacleTrash extends Obstacle {
  ObstacleTrash() : super(spritePath: 'bird.png');

  @override
  void update(double dt) {
    super.update(dt);
    double newY = position.y + (dt * 400);
    if (newY > (gameRef.size.y / 2) + (size.y / 2)) {
      newY = (gameRef.size.y / 2) + (size.y / 2);
    }
    position.y = newY;
  }
}
