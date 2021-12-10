import 'package:flutter/material.dart';
import 'package:flame/flame.dart';
import 'package:flutter_game/widgets/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  await Flame.device.setLandscape();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const HomePage(
        title: "Lights On",
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
