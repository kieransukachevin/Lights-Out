import 'package:flame/components.dart';
import 'package:flutter_game/game/lamp.dart';
import 'package:flutter_game/game/door.dart';

const double groundHeight = 32;
const double topBottomSpacing = 10;
const int numberOfTilesAlongWidth = 10;
const int numHallways = 5;

class Hallway {
  double gameHeight = 0.0;
  bool link = false;
  List<Lamp> lamps = [];
  List<Door> doors = [];
  Vector2 playerPostion = Vector2(0, 0);

  Hallway();

  void addLamp() {
    lamps.add(Lamp());
  }

  void addDoor() {
    doors.add(Door());
  }

  bool isLinked() {
    return link;
  }

  void setLinked() {
    link = true;
  }

  void setPlayerPosition(Vector2 position) {
    playerPostion = position;
  }

  List<Door> getDoors() {
    return doors;
  }

  List<Lamp> getLamps() {
    return lamps;
  }

  Vector2 getPlayerPosition() {
    return playerPostion;
  }
}
