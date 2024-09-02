import 'package:flame/components.dart';
import 'package:rotate_and_win_v1/component_providers/game_screen_components_provider.dart';
import 'package:rotate_and_win_v1/managers/game_screen_state_manager.dart';

import '../game_elements/core.dart';

class WinManager {
  GameScreenStateManager gameScreenStateManager = GameScreenStateManager.instance;
  bool _isWin = false;
  final Map<String, Vector2> startPetalsPosition;
  GameScreenComponentsProvider componentsProvider;
  List<SpriteComponent> coreList;
  Map<String, Vector2> currentPetalsPosition = {};

  bool isWin() => _isWin;

  WinManager(
      {required this.startPetalsPosition,
      required this.coreList,
      required this.gameScreenStateManager,
      required this.componentsProvider}) {
    for (SpriteComponent core in coreList) {
      (core as Core).setIsRotateFinishedListener(callback: () => analyzePlayingField());
    }
  }

  void resetWin() {
    _isWin = false;
  }

  void setCurrentPetalsPosition({required Map<String, Vector2> currentPetalsPosition}) {
    this.currentPetalsPosition = currentPetalsPosition;
  }

  void analyzePlayingField() {
    currentPetalsPosition = componentsProvider.getCurrentPetalsCenter();
    var i = 0;
    Iterable<String> keys = startPetalsPosition.keys;
    for (String key in keys) {
      int maxStartBorderX = startPetalsPosition[key]!.x.toInt() + 10;
      int minStartBorderX = maxStartBorderX - 20;
      int currentBorderX = currentPetalsPosition[key]!.x.toInt();
      int maxStartBorderY = startPetalsPosition[key]!.y.toInt() + 10;
      int minStartBorderY = maxStartBorderY - 20;
      int currentBorderY = currentPetalsPosition[key]!.y.toInt();
      if (key != 'blackRedH' && key != 'blackRedV' && key != 'blackBlueH' && key != 'blackBlueV' &&
          key != 'blackYellowV' && key != 'blackYellowH' && key != 'blackPurpleH' && key != 'blackPurpleV') {
        if ((minStartBorderX < currentBorderX && maxStartBorderX > currentBorderX) &&
            (minStartBorderY < currentBorderY && maxStartBorderY > currentBorderY)) {
          i++;
        }
      }
      if (key == 'blackRedH') {
        int maxStartBorderXBlackRedV = startPetalsPosition['blackRedV']!.x.toInt() + 10;
        int minStartBorderXBlackRedV = maxStartBorderXBlackRedV - 20;
        int maxStartBorderYBlackRedV = startPetalsPosition['blackRedV']!.y.toInt() + 10;
        int minStartBorderYBlackRedV = maxStartBorderYBlackRedV - 20;
        if (((minStartBorderX < currentBorderX && maxStartBorderX > currentBorderX) &&
            (minStartBorderY < currentBorderY && maxStartBorderY > currentBorderY)) ||
            ((minStartBorderXBlackRedV < currentBorderX && maxStartBorderXBlackRedV > currentBorderX) &&
                (minStartBorderYBlackRedV < currentBorderY && maxStartBorderYBlackRedV > currentBorderY))
        ) {
          i++;
        }
      }
      if (key == 'blackRedV') {
        int maxStartBorderXBlackRedH = startPetalsPosition['blackRedH']!.x.toInt() + 10;
        int minStartBorderXBlackRedH = maxStartBorderXBlackRedH - 20;
        int maxStartBorderYBlackRedH = startPetalsPosition['blackRedH']!.y.toInt() + 10;
        int minStartBorderYBlackRedH = maxStartBorderYBlackRedH - 20;
        if (((minStartBorderX < currentBorderX && maxStartBorderX > currentBorderX) &&
            (minStartBorderY < currentBorderY && maxStartBorderY > currentBorderY)) ||
            ((minStartBorderXBlackRedH < currentBorderX && maxStartBorderXBlackRedH > currentBorderX) &&
                (minStartBorderYBlackRedH < currentBorderY && maxStartBorderYBlackRedH > currentBorderY))
        ) {
          i++;
        }
      }
      if (key == 'blackBlueH') {
        int maxStartBorderXBlackBlueV = startPetalsPosition['blackBlueV']!.x.toInt() + 10;
        int minStartBorderXBlackBlueV = maxStartBorderXBlackBlueV - 20;
        int maxStartBorderYBlackBlueV = startPetalsPosition['blackBlueV']!.y.toInt() + 10;
        int minStartBorderYBlackBlueV = maxStartBorderYBlackBlueV - 20;
        if (((minStartBorderX < currentBorderX && maxStartBorderX > currentBorderX) &&
            (minStartBorderY < currentBorderY && maxStartBorderY > currentBorderY)) ||
            ((minStartBorderXBlackBlueV < currentBorderX && maxStartBorderXBlackBlueV > currentBorderX) &&
                (minStartBorderYBlackBlueV < currentBorderY && maxStartBorderYBlackBlueV > currentBorderY))
        ) {
          i++;
        }
      }
      if (key == 'blackBlueV') {
        int maxStartBorderXBlackBlueH = startPetalsPosition['blackBlueH']!.x.toInt() + 10;
        int minStartBorderXBlackBlueH = maxStartBorderXBlackBlueH - 20;
        int maxStartBorderYBlackBlueH = startPetalsPosition['blackBlueH']!.y.toInt() + 10;
        int minStartBorderYBlackBlueH = maxStartBorderYBlackBlueH - 20;
        if (((minStartBorderX < currentBorderX && maxStartBorderX > currentBorderX) &&
            (minStartBorderY < currentBorderY && maxStartBorderY > currentBorderY)) ||
            ((minStartBorderXBlackBlueH < currentBorderX && maxStartBorderXBlackBlueH > currentBorderX) &&
                (minStartBorderYBlackBlueH < currentBorderY && maxStartBorderYBlackBlueH > currentBorderY))
        ) {
          i++;
        }
      }
      if (key == 'blackYellowH') {
        int maxStartBorderXBlackYellowV = startPetalsPosition['blackYellowV']!.x.toInt() + 10;
        int minStartBorderXBlackYellowV = maxStartBorderXBlackYellowV - 20;
        int maxStartBorderYBlackYellowV = startPetalsPosition['blackYellowV']!.y.toInt() + 10;
        int minStartBorderYBlackYellowV = maxStartBorderYBlackYellowV - 20;
        if (((minStartBorderX < currentBorderX && maxStartBorderX > currentBorderX) &&
            (minStartBorderY < currentBorderY && maxStartBorderY > currentBorderY)) ||
            ((minStartBorderXBlackYellowV < currentBorderX && maxStartBorderXBlackYellowV > currentBorderX) &&
                (minStartBorderYBlackYellowV < currentBorderY && maxStartBorderYBlackYellowV > currentBorderY))
        ) {
          i++;
        }
      }
      if (key == 'blackYellowV') {
        int maxStartBorderXBlackYellowH = startPetalsPosition['blackYellowH']!.x.toInt() + 10;
        int minStartBorderXBlackYellowH = maxStartBorderXBlackYellowH - 20;
        int maxStartBorderYBlackYellowH = startPetalsPosition['blackYellowH']!.y.toInt() + 10;
        int minStartBorderYBlackYellowH = maxStartBorderYBlackYellowH - 20;
        if (((minStartBorderX < currentBorderX && maxStartBorderX > currentBorderX) &&
            (minStartBorderY < currentBorderY && maxStartBorderY > currentBorderY)) ||
            ((minStartBorderXBlackYellowH < currentBorderX && maxStartBorderXBlackYellowH > currentBorderX) &&
                (minStartBorderYBlackYellowH < currentBorderY && maxStartBorderYBlackYellowH > currentBorderY))
        ) {
          i++;
        }
      }
      if (key == 'blackPurpleV') {
        int maxStartBorderXBlackPurpleH = startPetalsPosition['blackPurpleH']!.x.toInt() + 10;
        int minStartBorderXBlackPurpleH = maxStartBorderXBlackPurpleH - 20;
        int maxStartBorderYBlackPurpleH = startPetalsPosition['blackPurpleH']!.y.toInt() + 10;
        int minStartBorderYBlackPurpleH = maxStartBorderYBlackPurpleH - 20;
        if (((minStartBorderX < currentBorderX && maxStartBorderX > currentBorderX) &&
            (minStartBorderY < currentBorderY && maxStartBorderY > currentBorderY)) ||
            ((minStartBorderXBlackPurpleH < currentBorderX && maxStartBorderXBlackPurpleH > currentBorderX) &&
                (minStartBorderYBlackPurpleH < currentBorderY && maxStartBorderYBlackPurpleH > currentBorderY))
        ) {
          i++;
        }
      }
      if (key == 'blackPurpleH') {
        int maxStartBorderXBlackPurpleV = startPetalsPosition['blackPurpleV']!.x.toInt() + 10;
        int minStartBorderXBlackPurpleV = maxStartBorderXBlackPurpleV - 20;
        int maxStartBorderYBlackPurpleV = startPetalsPosition['blackPurpleV']!.y.toInt() + 10;
        int minStartBorderYBlackPurpleV = maxStartBorderYBlackPurpleV - 20;
        if (((minStartBorderX < currentBorderX && maxStartBorderX > currentBorderX) &&
            (minStartBorderY < currentBorderY && maxStartBorderY > currentBorderY)) ||
            ((minStartBorderXBlackPurpleV < currentBorderX && maxStartBorderXBlackPurpleV > currentBorderX) &&
                (minStartBorderYBlackPurpleV < currentBorderY && maxStartBorderYBlackPurpleV > currentBorderY))
        ) {
          i++;
        }
      }
    }
    if (i == 23) {
      _isWin = true;
    }
  }
}
