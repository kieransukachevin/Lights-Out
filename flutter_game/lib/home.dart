import 'package:flutter/material.dart';
import 'package:flutter_game/controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text("Lights Out",
          style: Theme.of(context)
              .textTheme
              .headline4
              ?.copyWith(fontSize: 80, color: Colors.black)),
      TextButton(
          child: const Text('Play'),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              textStyle: MaterialStateProperty.all<TextStyle>(
                  const TextStyle(color: Color(0xFFFFFFFF)))),
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Controller())))
    ]);
    // return const Controller();
  }
}
