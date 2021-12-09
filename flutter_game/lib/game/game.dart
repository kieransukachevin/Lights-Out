import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/sprite.dart';
import 'package:flutter_game/game/player.dart';
import 'package:flutter_game/game/lamp.dart';
import 'package:flutter_game/game/hallway.dart';
import 'package:flutter_game/game/door.dart';
import 'package:flutter_game/game/house.dart';
import 'package:flutter_game/game/watcher.dart';

const numHallways = 4;

class BaseGame extends FlameGame {
  final Player _player = Player();
  final House _house = House(numHallways);

  late double gameWidth;
  late double gameHeight;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    addAll(_house.getCurrentHallway().getDoors());
    add(_player);

    Watcher watcher = Watcher.instance;
    watcher.addListener(() {
      _house.setCurrentHallway(watcher.getDoor());
      _player.setPosition(watcher.getPosition());
    });
  }

  @override
  void update(double dt) {
    super.update(dt);
    removeAll(children);
    addAll(_house.getCurrentHallway().getDoors());
    add(_player);
  }

  void setGameWidthAndHeight(double gameWidth, double gameHeight) {
    this.gameWidth = gameWidth;
    this.gameHeight = gameHeight;
    _player.setGameWidth(this.gameWidth);
  }

  void moveLeft() {
    _player.moveLeft();
  }

  void moveRight() {
    _player.moveRight();
  }

  void moveStop() {
    _player.stop();
  }

  void checkForDoor() {
    for (Door door in _house.getCurrentHallway().getDoors()) {
      // DEBUG
      print(
          'Door lower x : ${door.getWidth().x} Door upper x : ${door.getWidth().y} Player x : ${_player.getCenterX()}');
      if (door.getWidth().x <= _player.getCenterX() &&
          _player.getCenterX() <= door.getWidth().y) {
        print('Door Found');
        door.playAnimation();
      }
    }
  }
}
