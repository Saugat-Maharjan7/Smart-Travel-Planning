import 'package:flutter/material.dart';
import 'package:smart_travel_planning_appli/NavigatorBar/Navigation_drawer.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home_page';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF320D36),
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // title: Text(
        //   'Welcome',
        //   style: TextStyle(
        //     color: Colors.white,
        //     fontSize: 25.0,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
      ),
    );
  }
}
