import 'package:flutter_game/game/lamp.dart';
import 'package:flutter_game/game/door.dart';

const double groundHeight = 32;
const double topBottomSpacing = 10;
const int numberOfTilesAlongWidth = 10;
const int numHallways = 5;

class Hallway {
  bool link = false;
  List<Lamp> lamps = [];
  List<Door> doors = [];

  Hallway();

  void addLamp() {
    lamps.add(Lamp());
  }

  void addDoor() {
    doors.add(Door());
  }

  void setLinked() {
    link = true;
  }

  bool isLinked() {
    return link;
  }

  List<Door> getDoors() {
    return doors;
  }

  List<Lamp> getLamps() {
    return lamps;
  }
}
