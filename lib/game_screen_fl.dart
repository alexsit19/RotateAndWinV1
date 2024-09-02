import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:rotate_and_win_v1/rotate_and_win_game.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: GameWidget(game: RotateAndWinGame(context: context)));
  }
}
