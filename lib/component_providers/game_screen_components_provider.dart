import 'dart:ui';
import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:rotate_and_win_v1/game_elements/core.dart';
import 'package:rotate_and_win_v1/game_elements/petal.dart';
import 'package:rotate_and_win_v1/constants.dart';

class GameScreenComponentsProvider {
  late Core _blue;
  late Core _green;
  late Core _indigo;
  late Core _maroon;
  late Core _olive;
  late Core _orange;
  late Core _purple;
  late Core _yellow;
  late Core _red;
  late Petal _blackBlueH;
  late Petal _blackBlueV;
  late Petal _blackGreen;
  late Petal _blackMaroon;
  late Petal _blackOlive;
  late Petal _blackOrange;
  late Petal _blackPurpleV;
  late Petal _blackPurpleH;
  late Petal _blackYellowH;
  late Petal _blackRedH;
  late Petal _blackRedV;
  late Petal _blackYellowV;
  late Petal _blueOlive;
  late Petal _greenYellow;
  late Petal _maroonBlue;
  late Petal _orangePurple;
  late Petal _purpleGreen;
  late Petal _redOlive;
  late Petal _redOrange;
  late Petal _yellowMaroon;
  late Petal _indigoGreen;
  late Petal _indigoMaroon;
  late Petal _indigoOlive;
  late Petal _indigoOrange;
  late double _scale;
  late double _baseWidth;
  late double _rowCenterBottom;
  late double _rowCenterMiddle;
  late double _rowCenterTop;
  late double _columnCenterStart;
  late double _columnCenterMiddle;
  late double _columnCenterEnd;
  late SpriteComponent _background;
  late final Vector2 _blackOliveStartCenter;
  late final Vector2 _blackMaroonStartCenter;
  late final Vector2 _blackGreenStartCenter;
  late final Vector2 _blackRedHStartCenter;
  late final Vector2 _blackRedVStartCenter;
  late final Vector2 _blackBlueHStartCenter;
  late final Vector2 _blackBlueVStartCenter;
  late final Vector2 _blackYellowVStartCenter;
  late final Vector2 _blackYellowHStartCenter;
  late final Vector2 _blackPurpleHStartCenter;
  late final Vector2 _blackPurpleVStartCenter;
  late final Vector2 _redOrangeStartCenter;
  late final Vector2 _orangePurpleStartCenter;
  late final Vector2 _redOliveStartCenter;
  late final Vector2 _indigoOrangeStartCenter;
  late final Vector2 _purpleGreenStartCenter;
  late final Vector2 _indigoOliveStartCenter;
  late final Vector2 _indigoGreenStartCenter;
  late final Vector2 _indigoMaroonStartCenter;
  late final Vector2 _blueOliveStartCenter;
  late final Vector2 _maroonBlueStartCenter;
  late final Vector2 _yellowMaroonStartCenter;
  late final Vector2 _greenYellowStartCenter;

  Future<void> loadComponents(double width, double height) async {
    calculateComponentValues(width, height);
    var spriteMap = await Flame.images.load('BigPictures.png');
    var spriteMapTwo = await Flame.images.load('BigPictures2.png');
    var backgroundImage = await Flame.images.load('background_7.png');
    _background = SpriteComponent()
      ..sprite = Sprite(backgroundImage)
      ..size = Vector2(width, height);
    _red = Core(
        coreSprite: buildSprite(spriteMap, 606, 414, 300, 300),
        coreScale: Vector2(_scale, _scale),
        coreAnchor: Anchor.center);
    _blue = Core(
        coreSprite: buildSprite(spriteMap, 2, 716, 300, 300),
        coreScale: Vector2(_scale, _scale),
        coreAnchor: Anchor.center);
    _green = Core(
        coreSprite: buildSprite(spriteMap, 2, 414, 300, 300),
        coreScale: Vector2(_scale, _scale),
        coreAnchor: Anchor.center);
    _indigo = Core(
        coreSprite: buildSprite(spriteMap, 304, 716, 300, 300),
        coreScale: Vector2(_scale, _scale),
        coreAnchor: Anchor.center);
    _maroon = Core(
        coreSprite: buildSprite(spriteMap, 2, 112, 300, 300),
        coreScale: Vector2(_scale, _scale),
        coreAnchor: Anchor.center);
    _olive = Core(
        coreSprite: buildSprite(spriteMap, 304, 414, 300, 300),
        coreScale: Vector2(_scale, _scale),
        coreAnchor: Anchor.center);
    _orange = Core(
        coreSprite: buildSprite(spriteMap, 606, 716, 300, 300),
        coreScale: Vector2(_scale, _scale),
        coreAnchor: Anchor.center);
    _purple = Core(
        coreSprite: buildSprite(spriteMap, 304, 112, 300, 300),
        coreScale: Vector2(_scale, _scale),
        coreAnchor: Anchor.center);
    _yellow = Core(
        coreSprite: buildSprite(spriteMap, 606, 112, 300, 300),
        coreScale: Vector2(_scale, _scale),
        coreAnchor: Anchor.center);
    setCoreCenter();

    _indigoGreen = Petal(
        petalSprite: buildSprite(spriteMapTwo, 305, 256, 99, 252),
        petalScale: Vector2(_scale, _scale),
        petalAnchor: Anchor.center);
    _indigoMaroon = Petal(
        petalSprite: buildSprite(spriteMapTwo, 305, 2, 99, 252),
        petalScale: Vector2(_scale, _scale),
        petalAnchor: Anchor.center);
    _indigoOlive = Petal(
        petalSprite: buildSprite(spriteMapTwo, 406, 256, 99, 252),
        petalScale: Vector2(_scale, _scale),
        petalAnchor: Anchor.center);
    _indigoOrange = Petal(
        petalSprite: buildSprite(spriteMapTwo, 406, 2, 99, 252),
        petalScale: Vector2(_scale, _scale),
        petalAnchor: Anchor.center);
    _blackBlueH = Petal(
        petalSprite: buildSprite(spriteMap, 908, 764, 99, 252),
        petalScale: Vector2(_scale, _scale),
        petalAnchor: Anchor.center);
    _blackBlueV = Petal(
        petalSprite: buildSprite(spriteMap, 908, 764, 99, 252),
        petalScale: Vector2(_scale, _scale),
        petalAnchor: Anchor.center);
    _blackGreen = Petal(
        petalSprite: buildSprite(spriteMap, 908, 510, 99, 252),
        petalScale: Vector2(_scale, _scale),
        petalAnchor: Anchor.center);
    _blackMaroon = Petal(
        petalSprite: buildSprite(spriteMap, 908, 256, 99, 252),
        petalScale: Vector2(_scale, _scale),
        petalAnchor: Anchor.center);
    _blackOlive = Petal(
        petalSprite: buildSprite(spriteMap, 908, 2, 99, 252),
        petalScale: Vector2(_scale, _scale),
        petalAnchor: Anchor.center);
    _blackOrange = Petal(
        petalSprite: buildSprite(spriteMapTwo, 2, 256, 99, 252),
        petalScale: Vector2(_scale, _scale),
        petalAnchor: Anchor.center);
    _blackPurpleH = Petal(
        petalSprite: buildSprite(spriteMapTwo, 2, 2, 99, 252),
        petalScale: Vector2(_scale, _scale),
        petalAnchor: Anchor.center);
    _blackPurpleV = Petal(
        petalSprite: buildSprite(spriteMapTwo, 2, 2, 99, 252),
        petalScale: Vector2(_scale, _scale),
        petalAnchor: Anchor.center);
    _blackRedH = Petal(
        petalSprite: buildSprite(spriteMapTwo, 103, 256, 99, 252),
        petalScale: Vector2(_scale, _scale),
        petalAnchor: Anchor.center);
    _blackRedV = Petal(
        petalSprite: buildSprite(spriteMapTwo, 103, 256, 99, 252),
        petalScale: Vector2(_scale, _scale),
        petalAnchor: Anchor.center);
    _blackYellowH = Petal(
        petalSprite: buildSprite(spriteMapTwo, 103, 2, 99, 252),
        petalScale: Vector2(_scale, _scale),
        petalAnchor: Anchor.center);
    _blackYellowV = Petal(
        petalSprite: buildSprite(spriteMapTwo, 103, 2, 99, 252),
        petalScale: Vector2(_scale, _scale),
        petalAnchor: Anchor.center);
    _blueOlive = Petal(
        petalSprite: buildSprite(spriteMapTwo, 204, 256, 99, 252),
        petalScale: Vector2(_scale, _scale),
        petalAnchor: Anchor.center);
    _greenYellow = Petal(
        petalSprite: buildSprite(spriteMapTwo, 204, 2, 99, 252),
        petalScale: Vector2(_scale, _scale),
        petalAnchor: Anchor.center);
    _maroonBlue = Petal(
        petalSprite: buildSprite(spriteMapTwo, 507, 256, 99, 252),
        petalScale: Vector2(_scale, _scale),
        petalAnchor: Anchor.center);
    _orangePurple = Petal(
        petalSprite: buildSprite(spriteMapTwo, 507, 2, 99, 252),
        petalScale: Vector2(_scale, _scale),
        petalAnchor: Anchor.center);
    _purpleGreen = Petal(
        petalSprite: buildSprite(spriteMapTwo, 608, 256, 99, 252),
        petalScale: Vector2(_scale, _scale),
        petalAnchor: Anchor.center);
    _redOlive = Petal(
        petalSprite: buildSprite(spriteMapTwo, 608, 2, 99, 252),
        petalScale: Vector2(_scale, _scale),
        petalAnchor: Anchor.center);
    _redOrange = Petal(
        petalSprite: buildSprite(spriteMapTwo, 709, 256, 99, 252),
        petalScale: Vector2(_scale, _scale),
        petalAnchor: Anchor.center);
    _yellowMaroon = Petal(
        petalSprite: buildSprite(spriteMapTwo, 709, 2, 99, 252),
        petalScale: Vector2(_scale, _scale),
        petalAnchor: Anchor.center);
    setPetalCenter();
    setPetalAngle();
  }

  void calculateComponentValues(double width, double height) {
    _scale = width / widthForAllElements;
    _baseWidth = 300 * _scale;
    _rowCenterMiddle = height / 2;
    _columnCenterMiddle = width / 2;
    _rowCenterBottom = _rowCenterMiddle + _baseWidth;
    _rowCenterTop = _rowCenterMiddle - _baseWidth;
    _columnCenterStart = _columnCenterMiddle - _baseWidth;
    _columnCenterEnd = _columnCenterMiddle + _baseWidth;
  }

  List<SpriteComponent> coreList() {
    return [_red, _blue, _green, _indigo, _maroon, _olive, _orange, _purple, _yellow];
  }

  List<SpriteComponent> petalList() {
    return [
      _blackOrange,
      _blackOlive,
      _blackMaroon,
      _blackGreen,
      _blackRedH,
      _blackRedV,
      _blackBlueH,
      _blackBlueV,
      _blackYellowV,
      _blackYellowH,
      _blackPurpleH,
      _blackPurpleV,
      _redOrange,
      _orangePurple,
      _redOlive,
      _indigoOrange,
      _blueOlive,
      _maroonBlue,
      _yellowMaroon,
      _greenYellow,
      _indigoOlive,
      _indigoGreen,
      _indigoMaroon,
      _purpleGreen
    ];
  }

  SpriteComponent getBackground() {
    return _background;
  }

  void setPetalAngle() {
    _indigoOrange.angle = pi;
    _indigoGreen.angle = pi / 2;
    _indigoOlive.angle = -pi / 2;
    _blackOlive.angle = pi / 2;
    _blackMaroon.angle = pi;
    _blackGreen.angle = -pi / 2;
    _blackRedH.angle = pi / 2;
    _blackBlueH.angle = pi / 2;
    _blackBlueV.angle = pi;
    _blackYellowV.angle = pi;
    _blackYellowH.angle = -pi / 2;
    _blackPurpleH.angle = -pi / 2;
    _redOrange.angle = pi / 2;
    _orangePurple.angle = -pi / 2;
    _indigoOrange.angle = pi;
    _indigoGreen.angle = pi / 2;
    _indigoOlive.angle = -pi / 2;
    _blueOlive.angle = -pi;
    _maroonBlue.angle = pi / 2;
    _greenYellow.angle = pi;
    _yellowMaroon.angle = -pi / 2;
  }

  void setCoreCenter() {
    _red.center = Vector2(_columnCenterStart, _rowCenterTop);
    _blue.center = Vector2(_columnCenterEnd, _rowCenterTop);
    _green.center = Vector2(_columnCenterMiddle, _rowCenterBottom);
    _indigo.center = Vector2(_columnCenterMiddle, _rowCenterMiddle);
    _maroon.center = Vector2(_columnCenterEnd, _rowCenterMiddle);
    _olive.center = Vector2(_columnCenterMiddle, _rowCenterTop);
    _orange.center = Vector2(_columnCenterStart, _rowCenterMiddle);
    _purple.center = Vector2(_columnCenterStart, _rowCenterBottom);
    _yellow.center = Vector2(_columnCenterEnd, _rowCenterBottom);
  }

  List<Vector2> getLeftTouchPoints() {
    return [
      Vector2(_columnCenterStart - 1, _rowCenterTop),
      Vector2(_columnCenterEnd - 1, _rowCenterTop),
      Vector2(_columnCenterMiddle - 1, _rowCenterBottom),
      Vector2(_columnCenterMiddle - 1, _rowCenterMiddle),
      Vector2(_columnCenterEnd - 1, _rowCenterMiddle),
      Vector2(_columnCenterMiddle - 1, _rowCenterTop),
      Vector2(_columnCenterStart - 1, _rowCenterMiddle),
      Vector2(_columnCenterStart - 1, _rowCenterBottom),
      Vector2(_columnCenterEnd - 1, _rowCenterBottom),
    ];
  }

  List<Vector2> getRightTouchPoints() {
    return [
      Vector2(_columnCenterStart + 1, _rowCenterTop),
      Vector2(_columnCenterEnd + 1, _rowCenterTop),
      Vector2(_columnCenterMiddle + 1, _rowCenterBottom),
      Vector2(_columnCenterMiddle + 1, _rowCenterMiddle),
      Vector2(_columnCenterEnd + 1, _rowCenterMiddle),
      Vector2(_columnCenterMiddle + 1, _rowCenterTop),
      Vector2(_columnCenterStart + 1, _rowCenterMiddle),
      Vector2(_columnCenterStart + 1, _rowCenterBottom),
      Vector2(_columnCenterEnd + 1, _rowCenterBottom),
    ];
  }

  void setPetalCenter() {
    _blackOrange.center = Vector2(_columnCenterStart - _baseWidth / 2, _rowCenterMiddle);
    _blackOlive.center = Vector2(_columnCenterMiddle, _rowCenterTop - _baseWidth / 2);
    _blackMaroon.center = Vector2(_columnCenterEnd + _baseWidth / 2, _rowCenterMiddle);
    _blackGreen.center = Vector2(_columnCenterMiddle, _rowCenterBottom + _baseWidth / 2);
    _blackRedH.center = Vector2(_columnCenterStart, _rowCenterTop - _baseWidth / 2);
    _blackRedV.center = Vector2(_columnCenterStart - _baseWidth / 2, _rowCenterTop);
    _blackBlueH.center = Vector2(_columnCenterEnd, _rowCenterTop - _baseWidth / 2);
    _blackBlueV.center = Vector2(_columnCenterEnd + _baseWidth / 2, _rowCenterTop);
    _blackYellowV.center = Vector2(_columnCenterEnd + _baseWidth / 2, _rowCenterBottom);
    _blackYellowH.center = Vector2(_columnCenterEnd, _rowCenterBottom + _baseWidth / 2);
    _blackPurpleH.center = Vector2(_columnCenterStart, _rowCenterBottom + _baseWidth / 2);
    _blackPurpleV.center = Vector2(_columnCenterStart - _baseWidth / 2, _rowCenterBottom);
    _redOrange.center = Vector2(_columnCenterStart, _rowCenterMiddle - _baseWidth / 2);
    _orangePurple.center = Vector2(_columnCenterStart, _rowCenterMiddle + _baseWidth / 2);
    _redOlive.center = Vector2(_columnCenterStart + _baseWidth / 2, _rowCenterTop);
    _indigoOrange.center = Vector2(_columnCenterStart + _baseWidth / 2, _rowCenterMiddle);
    _purpleGreen.center = Vector2(_columnCenterStart + _baseWidth / 2, _rowCenterBottom);
    _indigoOlive.center = Vector2(_columnCenterMiddle, _rowCenterMiddle - _baseWidth / 2);
    _indigoGreen.center = Vector2(_columnCenterMiddle, _rowCenterMiddle + _baseWidth / 2);
    _indigoMaroon.center = Vector2(_columnCenterMiddle + _baseWidth / 2, _rowCenterMiddle);
    _blueOlive.center = Vector2(_columnCenterEnd - _baseWidth / 2, _rowCenterTop);
    _maroonBlue.center = Vector2(_columnCenterEnd, _rowCenterMiddle - _baseWidth / 2);
    _yellowMaroon.center = Vector2(_columnCenterEnd, _rowCenterBottom - _baseWidth / 2);
    _greenYellow.center = Vector2(_columnCenterEnd - _baseWidth / 2, _rowCenterBottom);
    setStartPetalsCenter();
  }

  void setStartPetalsCenter() {
    _blackOliveStartCenter = _blackOlive.absoluteCenter;
    _blackMaroonStartCenter = _blackMaroon.absoluteCenter;
    _blackGreenStartCenter = _blackGreen.absoluteCenter;
    _blackRedHStartCenter = _blackRedH.absoluteCenter;
    _blackRedVStartCenter = _blackRedV.absoluteCenter;
    _blackBlueHStartCenter = _blackBlueH.absoluteCenter;
    _blackBlueVStartCenter = _blackBlueV.absoluteCenter;
    _blackYellowVStartCenter = _blackYellowV.absoluteCenter;
    _blackYellowHStartCenter = _blackYellowH.absoluteCenter;
    _blackPurpleHStartCenter = _blackPurpleH.absoluteCenter;
    _blackPurpleVStartCenter = _blackPurpleV.absoluteCenter;
    _redOrangeStartCenter = _redOrange.absoluteCenter;
    _orangePurpleStartCenter = _orangePurple.absoluteCenter;
    _redOliveStartCenter = _redOlive.absoluteCenter;
    _indigoOrangeStartCenter = _indigoOrange.absoluteCenter;
    _purpleGreenStartCenter = _purpleGreen.absoluteCenter;
    _indigoOliveStartCenter = _indigoOlive.absoluteCenter;
    _indigoGreenStartCenter = _indigoGreen.absoluteCenter;
    _indigoMaroonStartCenter = _indigoMaroon.absoluteCenter;
    _blueOliveStartCenter = _blueOlive.absoluteCenter;
    _maroonBlueStartCenter = _maroonBlue.absoluteCenter;
    _yellowMaroonStartCenter = _yellowMaroon.absoluteCenter;
    _greenYellowStartCenter = _greenYellow.absoluteCenter;
  }

  Map<String, Vector2> getCurrentPetalsCenter() {
    return {
      'blackOlive': _blackOlive.absoluteCenter,
      'blackMaroon': _blackMaroon.absoluteCenter,
      'blackGreen': _blackGreen.absoluteCenter,
      'blackRedH': _blackRedH.absoluteCenter,
      'blackRedV': _blackRedV.absoluteCenter,
      'blackBlueH': _blackBlueH.absoluteCenter,
      'blackBlueV': _blackBlueV.absoluteCenter,
      'blackYellowV': _blackYellowV.absoluteCenter,
      'blackYellowH': _blackYellowH.absoluteCenter,
      'blackPurpleH': _blackPurpleH.absoluteCenter,
      'blackPurpleV': _blackPurpleV.absoluteCenter,
      'redOrange': _redOrange.absoluteCenter,
      'orangePurple': _orangePurple.absoluteCenter,
      'redOlive': _redOlive.absoluteCenter,
      'indigoOrange': _indigoOrange.absoluteCenter,
      'purpleGreen': _purpleGreen.absoluteCenter,
      'indigoOlive': _indigoOlive.absoluteCenter,
      'indigoGreen': _indigoGreen.absoluteCenter,
      'indigoMaroon': _indigoMaroon.absoluteCenter,
      'blueOlive': _blueOlive.absoluteCenter,
      'maroonBlue': _maroonBlue.absoluteCenter,
      'yellowMaroon': _yellowMaroon.absoluteCenter,
      'greenYellow': _greenYellow.absoluteCenter
    };
  }

  int printPosition() {
    print('CURRENT position black_olive , ${_blackOlive.position}');
    print('CURRENT Absolute center black_olive , ${_blackOlive.absoluteCenter}');
    print('CURRENT absolute position black_olive. ${_blackOlive.absolutePosition}');
    return 1;
  }

  Map<String, Vector2> getStartPetalsCenter() {
    return {
      'blackOlive': _blackOliveStartCenter,
      'blackMaroon': _blackMaroonStartCenter,
      'blackGreen': _blackGreenStartCenter,
      'blackRedH': _blackRedHStartCenter,
      'blackRedV': _blackRedVStartCenter,
      'blackBlueH': _blackBlueHStartCenter,
      'blackBlueV': _blackBlueVStartCenter,
      'blackYellowV': _blackYellowVStartCenter,
      'blackYellowH': _blackYellowHStartCenter,
      'blackPurpleH': _blackPurpleHStartCenter,
      'blackPurpleV': _blackPurpleVStartCenter,
      'redOrange': _redOrangeStartCenter,
      'orangePurple': _orangePurpleStartCenter,
      'redOlive': _redOliveStartCenter,
      'indigoOrange': _indigoOrangeStartCenter,
      'purpleGreen': _purpleGreenStartCenter,
      'indigoOlive': _indigoOliveStartCenter,
      'indigoGreen': _indigoGreenStartCenter,
      'indigoMaroon': _indigoMaroonStartCenter,
      'blueOlive': _blueOliveStartCenter,
      'maroonBlue': _maroonBlueStartCenter,
      'yellowMaroon': _yellowMaroonStartCenter,
      'greenYellow': _greenYellowStartCenter
    };
  }

  SpriteComponent buildSpriteComponent(Image image, double x, double y, double width, double height, double scale) {
    return SpriteComponent(
        sprite: Sprite(
          image,
          srcPosition: Vector2(x, y),
          srcSize: Vector2(width, height),
        ),
        scale: Vector2(_scale, _scale),
        anchor: Anchor.center);
  }

  Sprite buildSprite(Image image, double x, double y, double width, double height) {
    return Sprite(image, srcPosition: Vector2(x, y), srcSize: Vector2(width, height));
  }
}
