import 'dart:ui';

import 'package:flame/assets.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/animation.dart';

const double topBottomSpacing = 10;
const int numberOfTilesAlongWidth = 30;
const double animationTime = 0.1;

class Player extends SpriteAnimationComponent {
  SpriteAnimation? _runAnimationRight;
  SpriteAnimation? _runAnimationLeft;
  SpriteAnimation? _idleAnimationRight;
  SpriteAnimation? _idleAnimationLeft;

  SpriteSheet? spriteSheetRight;
  SpriteSheet? spriteSheetLeft;

  double speedX = 0.0;
  double xPosition = 0.0;
  double yPosition = 0.0;
  double maxSpeed = 0;
  double gameWidth = 0.0;
  double gameHeight = 0.0;
  double groundHeight = 0.0;

  Player() : super() {}

  @override
  Future<void> onLoad() async {
    // Create SpriteSheets
    spriteSheetRight = SpriteSheet(
        image: await Flame.images.load('Player-Sheet.png'),
        srcSize: Vector2.all(24.0));

    spriteSheetLeft = SpriteSheet(
        image: await Flame.images.load('Player-Sheet-left.png'),
        srcSize: Vector2.all(24.0));

    // Create Animations
    _runAnimationRight = spriteSheetRight?.createAnimation(
        row: 0, from: 3, to: 8, stepTime: animationTime);

    _idleAnimationRight = spriteSheetRight?.createAnimation(
        row: 0, from: 1, to: 2, stepTime: animationTime);

    _runAnimationLeft = spriteSheetLeft
        ?.createAnimation(row: 0, from: 1, to: 6, stepTime: animationTime)
        .reversed();

    _idleAnimationLeft = spriteSheetLeft
        ?.createAnimation(row: 0, from: 7, to: 8, stepTime: animationTime)
        .reversed();

    animation = _idleAnimationRight;
  }

  @override
  void update(double dt) {
    super.update(dt);

    // Update position based on speed.
    if (0 <= xPosition && xPosition <= gameWidth - width) {
      xPosition += speedX * dt;
    }
    if (xPosition < 0) xPosition = 0;
    if (xPosition > gameWidth - width) xPosition = gameWidth - width;

    position = Vector2(xPosition, yPosition);
  }

  @override
  void onGameResize(Vector2 gameSize) {
    super.onGameResize(gameSize);
    maxSpeed = gameSize.x * 0.5;
    groundHeight = gameSize.y * 0.3;

    size = Vector2.all(gameSize.x / 8);

    yPosition = gameSize.y - groundHeight - height + topBottomSpacing;
    gameWidth = gameSize.x;
    position = Vector2(xPosition, yPosition);
  }

  void setPosition(Vector2 newPosition) {
    position.x = newPosition.x;
  }

  void setGameWidth(double width) {
    gameWidth = width;
  }

  void moveLeft() {
    speedX = -maxSpeed;
    runLeft();
  }

  void moveRight() {
    speedX = maxSpeed;
    runRight();
  }

  void stop() {
    speedX = 0;
    idle();
  }

  void runRight() {
    animation = _runAnimationRight;
  }

  void runLeft() {
    animation = _runAnimationLeft;
  }

  double getCenterX() {
    return (x * 2 + width) / 2;
  }

  void idle() {
    if (animation == _runAnimationRight) animation = _idleAnimationRight;
    if (animation == _runAnimationLeft) animation = _idleAnimationLeft;
  }
}
