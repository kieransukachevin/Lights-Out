import 'package:flutter/material.dart';
import 'package:flutter_game/game/door.dart';
import 'package:flame/components.dart';

class MappedArea {
  MappedArea._private();

  static final MappedArea instance = MappedArea._private();
  final List<Vector2> mappedArea = [];

  // TODO: add hallway adding and implement MappedArea in door.dart and lamp.dart

  void addArea(Vector2 area) {
    mappedArea.add(area);
  }

  List<Vector2> getMap() {
    return mappedArea;
  }
}
