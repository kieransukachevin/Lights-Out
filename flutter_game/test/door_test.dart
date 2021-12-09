import 'package:flutter_game/game/door.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  test('testing door', () {
    var door1 = Door();
    var door2 = Door();
    door1.linkDoor(door2);
    expect(door1.getLinkedDoor(), door2);
    expect(door2.getLinkedDoor(), door1);
  });
}
