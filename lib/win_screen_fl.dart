import 'package:flutter/material.dart';

class WinScreen extends StatelessWidget {
  const WinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        return;
      },
      child: Stack(children: [
        const Center(child: Image(image: AssetImage('assets/images/screenshot.png'))),
        AlertDialog(
          backgroundColor: Colors.black,
          title: const Center(
            child: Text(
              'Congratulations!',
              style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
            ),
          ),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Center(
                  child: Text(
                    'You win!',
                    style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, 'start');
              },
              child: const Text(
                "Ok",
                style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        )
      ]),
    );
  }
}
