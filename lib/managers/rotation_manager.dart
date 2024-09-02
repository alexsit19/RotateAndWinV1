import 'package:flame/components.dart';
import 'package:rotate_and_win_v1/game_elements/petal.dart';
import 'package:rotate_and_win_v1/game_elements/core.dart';

class RotationManager {
  bool isRotateNow = false;
  bool directionRotateRight = false;
  double angle = 0;
  List<SpriteComponent> collapsePetalList = List.empty(growable: true);

  RotationManager(List<SpriteComponent> coreList) {
    for (SpriteComponent core in coreList) {
      (core as Core).setIsRotateListener(callback: () => isRotateNow = core.isRotate);
    }
  }

  void handleTouch(Vector2 touchPosition,  List<SpriteComponent> coreList, List<SpriteComponent> petalList) {
    collapsePetalList = List.empty(growable: true);
    double xTouch = touchPosition.x;
    double yTouch = touchPosition.y;

    if (isRotateNow) {
      return;
    }
    for (SpriteComponent core in coreList) {
      Vector2 position = core.position;
      double x = position.x;
      double y = position.y;
      double interval = core.scaledSize.x * 0.75;
      double startIntervalX = core.center.x - interval;
      double endIntervalX = core.center.x + interval;
      double startIntervalY = core.center.y - interval;
      double endIntervalY = core.center.y + interval;

      if (xTouch < x + core.scaledSize.x / 2 && xTouch > x - core.scaledSize.x / 2) {
        if (xTouch > x) {
          directionRotateRight = true;
        } else {
          directionRotateRight = false;
        }
        if (yTouch < y + core.scaledSize.y / 2 && yTouch > y - core.scaledSize.y / 2) {
          isRotateNow = true;
          (core as Core).initRotation(directionRotateRight);
          for (SpriteComponent petal in petalList) {
            if (petal.center.x > startIntervalX && petal.center.x < endIntervalX) {
              if (petal.center.y > startIntervalY && petal.center.y < endIntervalY) {
                collapsePetalList.add(petal);
              }
            }
          }
          for (SpriteComponent petal in collapsePetalList) {
            (petal as Petal).initRotation(directionRotateRight, core.center.x, core.center.y);
          }
        }
      }
    }
  }
}