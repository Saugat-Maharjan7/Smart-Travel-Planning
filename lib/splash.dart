import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF320D36),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'images/stintro.png',
            height: 100.0,
          ),
          SizedBox(
            height: 30.0,
          ),
          SpinKitChasingDots(
            color: Colors.tealAccent,
          ),
        ],
      ),
    );
  }
}
