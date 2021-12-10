import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_game/game/game.dart';

class Controller extends StatefulWidget {
  const Controller({Key? key}) : super(key: key);

  @override
  State<Controller> createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {
  BaseGame newGame = BaseGame();
  GameWidget? game;

  @override
  void initState() {
    super.initState();
    game = GameWidget(game: newGame);

    game = GameWidget(game: newGame);
  }

  @override
  Widget build(BuildContext context) {
    newGame.setGameWidthAndHeight(
        MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
    return Scaffold(
        body: RawKeyboardListener(
            focusNode: FocusNode(),
            onKey: (RawKeyEvent event) {
              handleKeyEvent(event);
            },
            autofocus: true,
            child:
                Center(child: AspectRatio(aspectRatio: 4 / 2, child: game))));
  }

  void handleKeyEvent(RawKeyEvent event) {
    if (event.isKeyPressed(LogicalKeyboardKey.arrowLeft)) {
      newGame.moveLeft();
    } else if (event.isKeyPressed(LogicalKeyboardKey.arrowRight)) {
      newGame.moveRight();
    } else if (event.isKeyPressed(LogicalKeyboardKey.keyZ)) {
      newGame.checkForDoor();
    } else if (event.isKeyPressed(LogicalKeyboardKey.keyX)) {
      newGame.checkForLamp();
    } else {
      newGame.moveStop();
    }
  }
}
