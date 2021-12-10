import 'dart:math';
import 'dart:ui' as ui;
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';

const double topBottomSpacing = 10;

class Lamp extends SpriteComponent {
  double groundHeight = 0.0;
  bool lightOn = false;
  double randomNum = 0.0;
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

    width = height = gameSize.x / 8;
    x = randomNum * (gameSize.x - 24);

    y = gameSize.y - groundHeight - height + topBottomSpacing;
  }

  Vector2 getWidth() {
    return Vector2(x, x + width);
  }

  void lightSwitch() {
    if (lightOn) {
      lightOn = false;
      sprite = spriteOff;
    } else {
      lightOn = true;
      sprite = spriteOn;
    }
  }
}
