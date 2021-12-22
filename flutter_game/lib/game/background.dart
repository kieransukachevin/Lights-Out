import 'package:flame/components.dart';
import 'package:flame/flame.dart';

class Background extends SpriteComponent {
  Background() : super();

  @override
  Future<void> onLoad() async {
    sprite = Sprite(await Flame.images.load('Hallway.png'));
  }

  @override
  void onGameResize(Vector2 gameSize) {
    super.onGameResize(gameSize);

    // Resize background image to the size of the background.
    size = Vector2(gameSize.x, gameSize.y);
  }
}
