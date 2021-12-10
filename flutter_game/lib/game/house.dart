import 'dart:math';
import 'package:flutter_game/game/hallway.dart';
import 'package:flutter_game/game/watcher.dart';

import 'door.dart';

class House {
  List<Hallway> _hallways = [];
  Hallway _currentHallway = Hallway();
  bool hallwaysLinked = false;

  House(int totalHallways) {
    // Calculate the random, even number of total lamps that is greater than the total number of hallways.
    int totalDoors = totalHallways +
        (totalHallways - 2) +
        Random().nextInt((totalHallways * 0.5).round());
    if (totalDoors.isOdd) {
      totalDoors++;
    }

    // Create a list of hallways.
    for (int i = 0; i < totalHallways; i++) {
      _hallways.add(Hallway());
    }

    // Distribute doors within each hallway.
    int index = 0;
    for (int i = 0; i < totalDoors; i++) {
      if (index == totalHallways) index = 0;
      _hallways[index].addDoor();
      index++;
    }

    for (var hallway in _hallways) {
      var total = Random().nextInt(1) + 1;
      for (int i = 0; i <= total; i++) {
        hallway.addLamp();
      }
    }

    // Lable each door with an id.
    labelDoors(_hallways);

    // Link hallways.
    for (var hallway in _hallways) {
      linkHallway(hallway, _hallways);
    }

    // DEBUG
    // printLinkedDoors(_hallways);
    // printHallways(totalHallways, _hallways);

    // Set the first hallway randomly.
    _currentHallway = _hallways[Random().nextInt(totalHallways - 1)];
  }

  void setCurrentHallway(Door? newDoor) {
    for (var hallway in _hallways) {
      for (var door in hallway.getDoors()) {
        if (door.getId() == newDoor?.getLinkedDoor()?.getId()) {
          _currentHallway = hallway;
          print('hallway changed');
        }
      }
    }
  }

  Hallway getCurrentHallway() {
    return _currentHallway;
  }

  void linkHallway(Hallway hallway, List<Hallway> allHallways) {
    for (var door in hallway.getDoors()) {
      if (door.isLinked()) continue;
      bool end = false;
      for (var innerHallway in allHallways) {
        if (hallway == innerHallway) continue;
        if (end == true) break;
        if (innerHallway.isLinked() && !hallwaysLinked) {
          continue;
        }
        for (var innerDoor in innerHallway.getDoors()) {
          if (innerDoor.isLinked() || door.getId() == innerDoor.getId()) {
            continue;
          } else {
            print('link door ${door.getId()} with ${innerDoor.getId()}');
            hallway.setLinked();
            innerHallway.setLinked();
            door.linkDoor(innerDoor);
            hallwaysLinked = checkIfAllHallwaysAreLinked(allHallways);
            end = true;
            break;
          }
        }
      }
    }
  }
}

void labelDoors(List<Hallway> hallways) {
  int doorIndex = 1;
  for (var hallway in hallways) {
    for (var door in hallway.getDoors()) {
      door.setId(doorIndex);
      doorIndex++;
    }
  }
}

bool checkIfAllHallwaysAreLinked(List<Hallway> allHallways) {
  bool allLinked = true;
  for (var hallway in allHallways) {
    if (!hallway.isLinked()) {
      allLinked = false;
    }
  }
  if (allLinked) print('All hallways linked!');
  return allLinked;
}

void printHallways(int totalHallways, List<Hallway> hallways) {
  for (int i = 0; i < totalHallways; i++) {
    print('Hallway $i : ');
    hallways[i].getDoors().forEach((door) => print('${door.getId()}'));
  }
}

void printLinkedDoors(List<Hallway> hallways) {
  var labeledHallways = Map();
  int hallwayIndex = 1;
  for (var hallway in hallways) {
    labeledHallways[hallwayIndex] = hallway;
    hallwayIndex++;
  }
  for (var hallway in hallways) {
    for (var door in hallway.getDoors()) {
      print(
          'Door ${door.getId()} is linked to ${door.getLinkedDoor()?.getId()}');
    }
  }
}
