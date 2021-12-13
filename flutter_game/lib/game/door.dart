import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:flutter_game/game/watcher.dart';

const double animationTime = 0.3;

class Door extends SpriteAnimationComponent {
  SpriteAnimation? _idleAnimation;
  SpriteAnimation? _openAnimation;
  Watcher? watcher = Watcher.instance;

  double groundHeight = 0.0;
  double randomNum = 0.0;
  double yPosition = 0.0;
  double xPosition = 0.0;

  int? doorId;

  Door? _linkedDoor;
  bool _isLinked = false;

  Door() : super() {
    randomNum = Random().nextDouble();
  }

  @override
  Future<void> onLoad() async {
    SpriteSheet spriteSheetRight = SpriteSheet(
        image: await Flame.images.load('door_blue-Sheet.png'),
        srcSize: Vector2(48.0, 36));
    _idleAnimation = spriteSheetRight.createAnimation(
        row: 0, from: 1, to: 2, stepTime: animationTime);
    _openAnimation = spriteSheetRight.createAnimation(
        row: 0, from: 2, to: 4, stepTime: animationTime);
    _openAnimation?.loop = false;
    _openAnimation?.onComplete = () {
      animation = _idleAnimation;
      watcher?.doorOpened(this);
      _openAnimation?.reset();
    };

    animation = _idleAnimation;
  }

  @override
  void onGameResize(Vector2 gameSize) {
    super.onGameResize(gameSize);
    groundHeight = gameSize.y * 0.3;

    size = Vector2(gameSize.x / 4, gameSize.x / (192 / 36));

    xPosition = randomNum * (gameSize.x - width);
    yPosition = gameSize.y - groundHeight - height;

    position = Vector2(xPosition, yPosition);
  }

  void playAnimation() {
    animation = _openAnimation;
  }

  void linkDoor(Door door) {
    _linkedDoor = door;
    door._linkedDoor = this;
    _isLinked = true;
    door._isLinked = true;
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

  void setId(int id) {
    doorId = id;
  }

  int? getId() {
    return doorId;
  }
}
