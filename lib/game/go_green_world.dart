import 'dart:async';

import 'package:flame/components.dart';
import 'package:gameproject/constants.dart';
import 'package:gameproject/game/go_green_game.dart';
import 'package:gameproject/game/sprites/bin.dart';
import 'package:gameproject/game/sprites/obstacle.dart';
import 'package:gameproject/game/sprites/player.dart';

class GoGreenWorld extends World with HasGameRef<GoGreenGame> {
  late final Player player;
  late final Bin bin;
  @override
  FutureOr<void> onLoad() {
    super.onLoad();
    player = Player();
    bin = Bin();
    add(player);
    add(bin);
    add(ObstacleTrash()..position = Vector2(gameWidth / 3, 0));
  }

  @override
  void update(double dt) {
    super.update(dt);
    children.whereType<Obstacle>().forEach((obs) {
      obs.position.y -= (dt * 400);
      if (obs.position.y < -(gameRef.size.y / 2)) {
        obs.position.y = gameRef.size.y / 2;
      }
    });
  }
}
