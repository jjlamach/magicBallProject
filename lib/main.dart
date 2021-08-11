import 'dart:math';

import 'package:flutter/material.dart';

/* Where the app starts */
void main() => runApp(
      MaterialApp(
        home: MagicBallUI(), // home = the UI we created as a "Stateless"
      ),
    );

/* Stateless UI for the MagicBall App */
class MagicBallUI extends StatelessWidget {
  // const MagicBallUI({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text(
          'Ask Me Anything',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25.0),
        ),
      ),
      /**
       * body = MagicBall()
       * Where MagicBall() is a Stateful widget. It changes states constantly since user is
       * going to interact with it.
       * **/
      body: MagicBall(),
    );
  }
}

// This is the ball that will change its state a lot so we build it as a stateful widget
class MagicBall extends StatefulWidget {
  // const MagicBall({Key? key}) : super(key: key);
  @override
  _MagicBallState createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> {
  int magicBallNumber = 1;
  void magicBallResponse() {
    setState(() {
      magicBallNumber = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {
                magicBallResponse();
              },
              child: Image(
                image: AssetImage('images/ball$magicBallNumber.png'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
