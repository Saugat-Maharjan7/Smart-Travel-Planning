import 'package:flutter/material.dart';
import 'package:smart_travel_planning_appli/Navigation_drawer.dart';

class Destination extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        backgroundColor: Color(0xFF320D36),
        appBar: AppBar(
          backgroundColor: Color(0xFF320D36),
          title: Text('Destination'),
        ),
      );
}
