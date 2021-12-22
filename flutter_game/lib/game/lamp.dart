import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';

const double topBottomSpacing = 10;

class Lamp extends SpriteComponent {
  late double groundHeight;
  late double randomNum;
  bool lightOn = false;
  Sprite? spriteOff;
  Sprite? spriteOn;

  Lamp() : super() {
    width = 24;
    height = 24;
    randomNum = Random().nextDouble();
    size = Vector2.all(24);
  }

  @override
  Future<void> onLoad() async {
    spriteOff = await Sprite.load('lamp1.png');
    spriteOn = await Sprite.load('lamp2.png');
    sprite = spriteOff;
  }

  @override
  void onGameResize(Vector2 gameSize) {
    super.onGameResize(gameSize);
    groundHeight = gameSize.y * 0.5;

    // Resize the lamp based no the game size.
    width = height = gameSize.x / 8;
    x = randomNum * (gameSize.x - 24);

    y = gameSize.y - groundHeight - height + topBottomSpacing;
  }

  // Toggle the light switch on and off.
  void lightSwitch() {
    if (lightOn) {
      lightOn = false;
      sprite = spriteOff;
    } else {
      lightOn = true;
      sprite = spriteOn;
    }
  }

  Vector2 getWidth() {
    return Vector2(x, x + width);
  }
}
