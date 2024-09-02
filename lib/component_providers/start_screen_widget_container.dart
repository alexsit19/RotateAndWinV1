import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/widgets.dart';

class StartScreenWidgetContainer {
  late SpriteWidget _titleWidget;
  late SpriteWidget _startButtonWidget;
  late SpriteWidget _exitButtonWidget;

  Future<void> loadWidgets() async {
    var titleButtonsMap = await Flame.images.load('titleAndButtons.png');
    var titleSprite = Sprite(
          titleButtonsMap,
          srcPosition: Vector2(2, 506),
          srcSize: Vector2(480, 440)
      );
    _titleWidget = SpriteWidget(sprite: titleSprite);
    var startButtonSprite = Sprite(
      titleButtonsMap,
        srcPosition: Vector2(2, 2),
        srcSize: Vector2(250, 250)
    );
    _startButtonWidget = SpriteWidget(sprite: startButtonSprite);

  }

  SpriteWidget getTitleWidget() {
    return _titleWidget;
  }

  SpriteWidget getStartButton() {
    return _startButtonWidget;
  }


}