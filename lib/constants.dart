import 'package:rotate_and_win_v1/managers/game_screen_state_manager.dart';

import 'managers/states.dart';

const double widthForAllElements = 300 * 3 + 99;
const double gameDeltaAngle = 0.05;
const double mixingDeltaAngel = 0.6;
const int stepCount = 50;

double getDeltaAngle() {
  States currentState = GameScreenStateManager.instance.currentState;
  double deltaAngle = gameDeltaAngle;
  if (currentState == States.mixing) {
    deltaAngle = mixingDeltaAngel;
  }
  if (currentState == States.game) {
    deltaAngle = gameDeltaAngle;
  }
  return deltaAngle;
}