import 'dart:async';

import 'package:flame/components.dart';
import 'package:gameproject/game/go_green_game.dart';
import 'package:gameproject/game/sprites/bin.dart';
import 'package:gameproject/game/sprites/player.dart';

class GoGreenWorld extends World with HasGameRef<GoGreenGame> {
  late final Player player;
  late final Bin bin;
  @override
  FutureOr<void> onLoad() {
    super.onLoad();
    player = Player();
    bin = Bin();
    add(bin);
    add(player);
  }
}
