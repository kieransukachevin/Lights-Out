import 'package:flutter/material.dart';
import 'package:flutter_game/game/door.dart';
import 'package:flame/components.dart';

class Watcher with ChangeNotifier {
  Watcher._private();

  static final Watcher instance = Watcher._private();

  Door? _door;
  Vector2 _position = Vector2(0, 0);

  void doorOpened(Door door) {
    _door = door;
    _position = _door!.getWidth();
    notifyListeners();
  }

  Vector2 getPosition() {
    return _position;
  }

  Door? getDoor() {
    return _door;
  }
}
