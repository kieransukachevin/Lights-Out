import 'package:flutter/material.dart';
import 'package:flutter_game/widgets/button.dart';
import 'package:flutter_game/widgets/controller.dart';
import 'package:flutter_game/widgets/controls.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: (4 / 2),
        child: Stack(alignment: Alignment.center, children: [
          Image.asset('assets/images/Hallway_home_screen.png',
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fitWidth),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/title.png',
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width / 2,
                    fit: BoxFit.fitWidth),
                CustomButton(
                    asset: 'assets/images/play_button.png',
                    action: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Controller()))),
                CustomButton(
                    asset: 'assets/images/controls_button.png',
                    action: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Controls())))
              ])
        ]));
  }
}
