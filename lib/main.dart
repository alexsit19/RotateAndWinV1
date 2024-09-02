import 'package:flame_splash_screen/flame_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rotate_and_win_v1/component_providers/start_screen_widget_container.dart';
import 'package:rotate_and_win_v1/flame_splash_screen.dart';
import 'package:rotate_and_win_v1/game_screen_fl.dart';
import 'package:rotate_and_win_v1/start_screen_fl.dart';
import 'package:rotate_and_win_v1/win_screen_fl.dart';

void main() async {
  final widgetContainer = StartScreenWidgetContainer();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
  await widgetContainer.loadWidgets();
  runApp(RotateAndWinApp(widgetContainer: widgetContainer));
}



class RotateAndWinApp extends StatelessWidget {
  final StartScreenWidgetContainer widgetContainer;

  const RotateAndWinApp({Key? key, required this.widgetContainer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/' : (context) => SplashScreenGame(),
        'start' : (context) => StartScreen(widgetContainer: widgetContainer),
        'game' : (context) => const GameScreen(),
        'win' : (context) => const WinScreen(),
      },
    );
  }
}

