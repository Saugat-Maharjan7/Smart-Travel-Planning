import 'package:flutter/material.dart';
import 'package:smart_travel_planning_appli/models/destination_model.dart';

class DestinationScreen extends StatefulWidget {

  final Destination destination;

  DestinationScreen({this.destination});

  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
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
                    child: Hero(
                      tag: widget.destination.imageUrl,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image(
                          image: AssetImage(widget.destination.imageUrl),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(icon: Icon(Icons.arrow_back,
                    color: Colors.tealAccent,
                    size: 30,),
                    onPressed: () => Navigator.pop(context),
                    ),

                Row(
                     children: [
                   IconButton(icon: Icon(Icons.sort_outlined,
                     color: Colors.tealAccent,
                     size: 30,),
                      onPressed: () => Navigator.pop(context),
                      ),
                       ],
                  ),
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
