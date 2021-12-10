import 'package:flutter/material.dart';
import 'package:flutter_game/game/door.dart';
import 'package:flame/components.dart';

class Watcher with ChangeNotifier {
  Watcher._private();

  static final Watcher instance = Watcher._private();

  Door? _door;

  void doorOpened(Door door) {
    _door = door;
    print('New door width is: ${_door!.getLinkedDoor()!.getWidth()}');
    notifyListeners();
  }

  Door? getDoor() {
    return _door;
  }
}
