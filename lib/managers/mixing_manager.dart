import 'package:flame/components.dart';
import 'package:rotate_and_win_v1/managers/game_screen_state_manager.dart';
import 'package:rotate_and_win_v1/managers/rotation_manager.dart';
import 'dart:math';

import '../constants.dart';

class MixingManager {
  final RotationManager rotationManager;
  final gameScreenStateManager = GameScreenStateManager.instance;
  bool _isDone = false;
  Random random = Random();
  List<Vector2> rightTouchPoints;
  List<Vector2> leftTouchPoints;
  List<SpriteComponent> coreList;
  List<SpriteComponent> petalList;
  int _stepCount = 0;

  MixingManager({
    required this.rotationManager,
    required this.rightTouchPoints,
    required this.leftTouchPoints,
    required this.coreList,
    required this.petalList,
  });

  void initMixing() {
    _isDone = false;
    gameScreenStateManager.setStateMixing();
    _stepCount = stepCount;
  }

  bool isDone() => _isDone;

  Vector2 _calculateTouchPoint() {
    Vector2 touchPoint = Vector2.zero();
    if (random.nextBool()) {
      touchPoint = rightTouchPoints[random.nextInt(9)];
    } else {
      touchPoint = leftTouchPoints[random.nextInt(9)];
    }
    return touchPoint;
  }

  void mixing() {
    if (_stepCount != 0 && !rotationManager.isRotateNow) {
        Vector2 touchPosition = _calculateTouchPoint();
        rotationManager.handleTouch(touchPosition, coreList, petalList);
        _stepCount--;
      }
      if (_stepCount == 0) {
        _isDone = true;
        gameScreenStateManager.setStateGame();
      }
  }
}
