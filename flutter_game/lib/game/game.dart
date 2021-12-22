import 'package:flame/game.dart';
import 'package:flutter_game/game/background.dart';
import 'package:flutter_game/game/player.dart';
import 'package:flutter_game/game/lamp.dart';
import 'package:flutter_game/game/door.dart';
import 'package:flutter_game/game/house.dart';
import 'package:flutter_game/game/watcher.dart';

const numHallways = 4;

class BaseGame extends FlameGame {
  final Player _player = Player();
  final House _house = House(numHallways);
  final Watcher _watcher = Watcher.instance;
  final Background _background = Background();

  late double gameWidth;
  late double gameHeight;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    // Add the background and initial components.
    add(_background);
    addAll(_house.getCurrentHallway().getDoors());
    addAll(_house.getCurrentHallway().getLamps());
    add(_player);

    _watcher.addListener(() {
      // When a door is opened, notify _house to update to the new hallway.
      _house.setCurrentHallway(_watcher.getDoor());

      // When a door is opened, notify _player to update to the new door position.
      _player.setXPosition(_watcher.getDoor()!.getLinkedDoor()!.getWidth().x);
    });
  }

  @override
  void update(double dt) {
    super.update(dt);
    removeAll(children);

    // Add back the background, the current hallway doors and lamps, and player.
    add(_background);
    addAll(_house.getCurrentHallway().getDoors());
    addAll(_house.getCurrentHallway().getLamps());
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
      if (door.getWidth().x <= _player.getCenterX() &&
          _player.getCenterX() <= door.getWidth().y) {
        door.playAnimation();
      }
    }
  }

  void checkForLamp() {
    for (Lamp lamp in _house.getCurrentHallway().getLamps()) {
      if (lamp.getWidth().x <= _player.getCenterX() &&
          _player.getCenterX() <= lamp.getWidth().y) {
        lamp.lightSwitch();
      }
    }
  }
}
