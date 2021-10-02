import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:smart_travel_planning_appli/Home/recommendedSectionDetails.dart';
import 'package:smart_travel_planning_appli/models/activity_season_model.dart';
import 'package:smart_travel_planning_appli/models/seasonal_model.dart';


class SeasonalWinter extends StatefulWidget {

  final Season season;

  SeasonalWinter({this.season});

  @override
  _SeasonalWinterState createState() => _SeasonalWinterState();
}

class _SeasonalWinterState extends State<SeasonalWinter> {
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
                  height: 340,
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
                    tag: AssetImage('images/winter.jpg'),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image(
                        image: AssetImage('images/winter.jpg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(icon: Icon(Icons.arrow_back,
                      color: Colors.black,
                      size: 30,),
                      onPressed: () => Navigator.pop(context),),

                    Row(
                      children: [
                        IconButton(icon: Icon(Icons.sort_outlined,
                          color: Colors.black,
                          size: 30,),
                          onPressed: () => print('Sorting form'),
                        ),
                      ],
                    ),
                  ],
                ),

                Positioned(
                  left: 20,
                  bottom: 20,
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            FlutterIcons.weather_snowy_rainy_mco,
                            size: 20.0,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Winter',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

              ],
            ),
            // Expanded(
            //   child: ListView.builder(
            //
            //       itemCount: widget.season.activities.length,
            //       itemBuilder: (BuildContext context, int index){
            //
            //         Activity activity = widget.season.activities[index];
            //         return Stack(
            //           children: [
            //             GestureDetector(
            //               onTap: () => print('Clicked for information'),
            //               child: Container(
            //                 margin: EdgeInsets.fromLTRB(40, 5, 20, 5),
            //                 height: 170,
            //                 width: double.infinity,
            //                 decoration: BoxDecoration(
            //                   color: Colors.white30,
            //                   borderRadius: BorderRadius.circular(20),
            //                 ),
            //                 child: Padding(
            //                   padding: EdgeInsets.fromLTRB(100, 20, 20, 20),
            //                   child: Column(
            //                     children: [
            //                       Row(
            //                         children: [
            //                           Expanded(
            //                             child: Container(
            //                               width: 120,
            //                               child: Text(activity.name,
            //                                 style: TextStyle(
            //                                   fontSize: 20,
            //                                   fontWeight: FontWeight.bold,
            //                                 ),
            //
            //                               ),
            //                             ),
            //                           ),
            //                         ],
            //                       ),
            //                       SizedBox(
            //                         height: 10,
            //                       ),
            //                       Row(
            //                         children: [
            //                           Expanded(
            //                             child: Container(
            //                               width: 200,
            //                               child: Text(activity.info,
            //                                 style: TextStyle(
            //                                   fontSize: 16,
            //                                 ),
            //                               ),
            //                             ),
            //                           ),
            //                         ],
            //                       ),
            //
            //                     ],
            //                   ),
            //                 ),
            //               ),
            //             ),
            //
            //             Positioned(
            //               left: 20,
            //               top: 15,
            //               bottom: 15,
            //               child: ClipRRect(
            //                 borderRadius: BorderRadius.circular(20),
            //                 child: Image(
            //                   width: 110,
            //                   image: AssetImage(activity.imgUrl),
            //                   fit: BoxFit.cover,
            //                 ),
            //               ),
            //             ),
            //
            //           ],
            //         );
            //       },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
