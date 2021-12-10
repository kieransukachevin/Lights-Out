import 'package:flutter/material.dart';
import 'package:flutter_game/widgets/button.dart';

const double inset = 35;
const double scale = 7;

class Controls extends StatelessWidget {
  const Controls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: (4 / 2),
        child: Stack(alignment: Alignment.center, children: [
          Image.asset('assets/images/Hallway_home_screen.png',
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fitWidth),
          Column(children: [
            Image.asset('assets/images/move_controls.png',
                height: MediaQuery.of(context).size.width / 5,
                width: MediaQuery.of(context).size.width / 5,
                fit: BoxFit.fill),
            Image.asset('assets/images/action_controls.png',
                height: MediaQuery.of(context).size.width / 5,
                width: MediaQuery.of(context).size.width / 5,
                fit: BoxFit.fill),
            CustomButton(
                asset: 'assets/images/back_button.png',
                action: () => Navigator.pop(context))
          ])
        ]));
  }
}
