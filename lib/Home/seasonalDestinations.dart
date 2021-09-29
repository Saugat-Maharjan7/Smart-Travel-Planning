import 'package:flutter/material.dart';
import 'package:smart_travel_planning_appli/models/seasonal_model.dart';

class SeasonalScreen extends StatefulWidget {

  final Season season;

  SeasonalScreen({this.season});

  @override
  _SeasonalScreenState createState() => _SeasonalScreenState();
}

class _SeasonalScreenState extends State<SeasonalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF320D36),
      body: Padding(
        padding: EdgeInsets.only(top: 25.0),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 6,
                    ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image(
                      image: AssetImage(widget.season.imgUrl),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconButton(icon: Icon(Icons.arrow_back,
                      color: Colors.tealAccent,
                      size: 30,),
                      onPressed: () => Navigator.pop(context),)
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
