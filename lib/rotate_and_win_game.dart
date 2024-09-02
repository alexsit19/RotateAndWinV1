import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:rotate_and_win_v1/managers/game_screen_state_manager.dart';
import 'package:rotate_and_win_v1/managers/win_manager.dart';
import 'component_providers/game_screen_components_provider.dart';
import 'managers/mixing_manager.dart';
import 'managers/rotation_manager.dart';

class RotateAndWinGame extends FlameGame with TapCallbacks, HasGameRef<RotateAndWinGame> {
  final BuildContext context;
  late final RouterComponent router;
  final _componentsProvider = GameScreenComponentsProvider();
  final gameScreenStateManager = GameScreenStateManager.instance;
  late WinManager _winManager;
  late RotationManager _rotationManager;
  late MixingManager? _mixingManager;

  RotateAndWinGame({required this.context});

  @override
  Future<void> onLoad() async {
    var width = size[0];
    var height = size[1];
    await _componentsProvider.loadComponents(width, height);
    addAll(
      _componentsProvider.coreList() + _componentsProvider.petalList(),
    );
    _winManager = WinManager(
      startPetalsPosition: _componentsProvider.getStartPetalsCenter(),
      coreList: _componentsProvider.coreList(),
      componentsProvider: _componentsProvider,
      gameScreenStateManager: gameScreenStateManager,
    );
    _rotationManager = RotationManager(_componentsProvider.coreList());
    _mixingManager = MixingManager(
        rotationManager: _rotationManager,
        rightTouchPoints: _componentsProvider.getRightTouchPoints(),
        leftTouchPoints: _componentsProvider.getLeftTouchPoints(),
        coreList: _componentsProvider.coreList(),
        petalList: _componentsProvider.petalList());
    _mixingManager?.initMixing();
  }

  @override
  bool containsLocalPoint(Vector2 point) => true;

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    _mixingManager?.mixing();
    if (_winManager.isWin()) {
      //тут есть выигрыш

      Future.delayed(Duration.zero, () {Navigator.pushNamed(context, 'win');});
    }
  }

  @override
  void onTapDown(TapDownEvent event) {
    if (_mixingManager != null) {
      if (!_mixingManager!.isDone()) {
        return;
      }
    }
    super.onTapDown(event);
    _rotationManager.handleTouch(event.localPosition, _componentsProvider.coreList(), _componentsProvider.petalList());
    _winManager.setCurrentPetalsPosition(currentPetalsPosition: _componentsProvider.getCurrentPetalsCenter());
    //_winManager.analyzePlayingField();
  }
}
