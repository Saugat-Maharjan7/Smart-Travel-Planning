import 'package:flutter/material.dart';
import 'package:smart_travel_planning_appli/Home_extendedDetails//packages.dart';
import 'package:smart_travel_planning_appli/FilterScreen/Under5k.dart';
import 'package:smart_travel_planning_appli/FilterScreen/Above5k.dart';


class FilterScreen extends StatefulWidget {

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF320D36),
    appBar: AppBar(

    backgroundColor: Colors.transparent,
    title: Text('Filter According to Price'),
    ),
    body: Container(
      child: Column(
        children:[
          Padding(
            padding: const EdgeInsets.only(top:28.0),
            child: Center(
              child: ElevatedButton(onPressed: (){Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Under5k()));}, child: Text ('Under 5000')),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: Center(
              child: ElevatedButton(onPressed: (){Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Above5k()));}, child: Text('Above 5000')),
            ),
          )
        ],
      ),
    )
    );
  }
}
