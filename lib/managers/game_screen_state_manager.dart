import 'package:rotate_and_win_v1/managers/states.dart';

class GameScreenStateManager {
  States currentState = States.mixing;
  GameScreenStateManager._internal();
  static final GameScreenStateManager _instance = GameScreenStateManager._internal();
  static GameScreenStateManager get instance => _instance;

  void setStateWin() {
    currentState = States.win;
  }

  void setStateGame() {
    currentState = States.game;
  }

  void setStateMixing() {
    currentState = States.mixing;
  }
}