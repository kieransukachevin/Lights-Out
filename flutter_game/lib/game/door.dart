import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:flutter_game/game/watcher.dart';

const double animationTime = 0.4;

class Door extends SpriteAnimationComponent {
  SpriteAnimation? _idleAnimation;
  SpriteAnimation? _openAnimation;

  Watcher watcher = Watcher.instance;
  Door? _linkedDoor;

  bool _isLinked = false;

  late double _groundHeight;
  late double _randomNum;

  late int doorId;

  Door() : super() {
    _randomNum = Random().nextDouble();
  }

  @override
  Future<void> onLoad() async {
    SpriteSheet spriteSheetRight = SpriteSheet(
        image: await Flame.images.load('door_blue-Sheet.png'),
        srcSize: Vector2(48.0, 36));

    // Create the idle animation.
    _idleAnimation = spriteSheetRight.createAnimation(
        row: 0, from: 1, to: 2, stepTime: animationTime);

    // Create the open animation.
    _openAnimation = spriteSheetRight.createAnimation(
        row: 0, from: 2, to: 4, stepTime: animationTime);
    _openAnimation?.loop = false;
    _openAnimation?.onComplete = () {
      animation = _idleAnimation;
      watcher.doorOpened(this);
      _openAnimation?.reset();
    };

    // Set the initial animation to idle.
    animation = _idleAnimation;
  }

  @override
  void onGameResize(Vector2 gameSize) {
    super.onGameResize(gameSize);
    _groundHeight = gameSize.y * 0.3;

    // Resize the door based on the game size.
    size = Vector2(gameSize.x / 4, gameSize.x / (192 / 36));

    // Reposition the door based on the game size.
    position = Vector2(
        _randomNum * (gameSize.x - width), gameSize.y - _groundHeight - height);
  }

  void playAnimation() {
    animation = _openAnimation;
  }

  void linkDoor(Door door) {
    // Link the passed in door to this door.
    _linkedDoor = door;
    door._linkedDoor = this;
    _isLinked = true;
    door._isLinked = true;
  }

  void setId(int id) {
    doorId = id;
  }

  Door? getLinkedDoor() {
    return _linkedDoor;
  }

  bool isLinked() {
    return _isLinked;
  }

  Vector2 getWidth() {
    return Vector2(x + width / 2, x + width);
  }

  int getId() {
    return doorId;
  }
}
