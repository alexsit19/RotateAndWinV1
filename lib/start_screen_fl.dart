import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rotate_and_win_v1/component_providers/start_screen_widget_container.dart';

class StartScreen extends StatelessWidget {
  final StartScreenWidgetContainer widgetContainer;

  const StartScreen({super.key, required this.widgetContainer});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        SystemNavigator.pop();
        return;
      },
      child: Stack(children: [
        Container(
            alignment: Alignment.topLeft,
            decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/background_7.png'), fit: BoxFit.fill))),
        Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
          SizedBox(
      
              height: height / 2,
              child: Padding(padding: const EdgeInsets.only(top: 25, left: 25, right: 25), child: widgetContainer.getTitleWidget())),
      
          SizedBox(
            width: width / 2,
            height: width / 2,
            child: GestureDetector(
                onTapDown: (TapDownDetails details) {
                  Navigator.pushNamed(context, 'game');
                },
                child: widgetContainer.getStartButton()),
          )
        ])
      ]),
    );
  }
}
