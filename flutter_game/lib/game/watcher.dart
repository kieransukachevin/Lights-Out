import 'package:flutter/material.dart';
import 'package:flutter_game/game/door.dart';

class Watcher with ChangeNotifier {
  Watcher._private();

  static final Watcher instance = Watcher._private();

  Door? _door;

  void doorOpened(Door door) {
    _door = door;
    notifyListeners();
  }

  Door? getDoor() {
    return _door;
  }
}
