import 'dart:math';
import 'package:flame/components.dart';
import 'package:rotate_and_win_v1/constants.dart';

class Petal extends SpriteComponent {
  final Sprite petalSprite;
  final Vector2 petalScale;
  final Anchor petalAnchor;
  double centerRotationX = 0;
  double centerRotationY = 0;
  double rotateAngle = 0;
  double targetAngle = 0;
  double correctAngle = 0;
  double deltaSum = 0;
  bool isRight = true;
  bool isRotate = false;

  Petal({required this.petalSprite, required this.petalScale, required this.petalAnchor})
      : super(sprite: petalSprite, scale: petalScale, anchor: petalAnchor);

  void initRotation(bool isRightRotation, double centerX, double centerY) {
    isRotate = true;
    deltaSum = 0;
    correctAngle = 0;
    isRight = isRightRotation;
    centerRotationX = centerX;
    centerRotationY = centerY;
    setAngles();

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
          deltaSum += deltaAngle;
          position.rotate(deltaAngle, center: Vector2(centerRotationX, centerRotationY));
          rotateAngle -= deltaAngle;
        } else {
          angle = targetAngle;
          correctAngle = (pi / 2) - deltaSum;
          position.rotate(correctAngle, center: Vector2(centerRotationX, centerRotationY));
          isRotate = false;
        }
      } else {
        if (rotateAngle > 0) {
          angle -= deltaAngle;
          deltaSum -= deltaAngle;
          position.rotate(-deltaAngle, center: Vector2(centerRotationX, centerRotationY));
          rotateAngle -= deltaAngle;
        } else {
          angle = targetAngle;
          correctAngle = (pi / 2) - deltaSum.abs();
          position.rotate(-correctAngle, center: Vector2(centerRotationX, centerRotationY));
          isRotate = false;
        }
      }
    }
  }
}