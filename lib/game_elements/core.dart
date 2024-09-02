import 'package:flame/components.dart';
import 'dart:math';
import 'package:rotate_and_win_v1/constants.dart';

class Core extends SpriteComponent {
  final Sprite coreSprite;
  final Vector2 coreScale;
  final Anchor coreAnchor;
  double rotateAngle = 0;
  double targetAngle = 0;
  bool isRight = true;
  bool isRotate = false;
  bool Function() isRotateCallback = () => false;
  void Function() isRotateFinished = () {};

  Core({required this.coreSprite, required this.coreScale, required this.coreAnchor})
      : super(sprite: coreSprite, scale: coreScale, anchor: coreAnchor);

  void initRotation(bool isRightRotation) {
    isRight = isRightRotation;
    isRotate = true;
    setAngles();
  }

  void setIsRotateListener({required bool Function () callback}) {
    isRotateCallback = callback;
  }

  void setIsRotateFinishedListener({required void Function () callback}) {
    isRotateFinished = callback;
  }

  void setAngles() {
    rotateAngle = pi / 2;
    if (isRight) {
      targetAngle = angle + rotateAngle;
    } else {
      targetAngle = angle - rotateAngle;
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    double deltaAngle = getDeltaAngle();
    if (isRotate) {
      if (isRight) {
        if (rotateAngle > 0) {
          angle += deltaAngle;
          rotateAngle -= deltaAngle;
        } else {
          angle = targetAngle;
          isRotate = false;
          isRotateCallback();
          isRotateFinished();
        }
      } else {
        if (rotateAngle > 0) {
          angle -= deltaAngle;
          rotateAngle -= deltaAngle;
        } else {
          angle = targetAngle;
          isRotate = false;
          isRotateCallback();
          isRotateFinished();
        }
      }
    }
  }
}
