import 'package:flutter/material.dart';
import 'package:smart_travel_planning_appli/models/activity_season_model.dart';
import 'package:smart_travel_planning_appli/models/seasonal_model.dart';


class SeeAllSeasonal extends StatefulWidget {

  final Season season;

  SeeAllSeasonal({this.season});

  @override
  _SeeAllSeasonalState createState() => _SeeAllSeasonalState();
}

class _SeeAllSeasonalState extends State<SeeAllSeasonal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF320D36),
      body: Expanded(
        child: ListView.builder(
            itemCount: widget.season.activities.length,
            itemBuilder: (BuildContext context, int index){
              Activity activity = widget.season.activities[index];
              return Stack(
                children: [
                  GestureDetector(
                    onTap: () => print('Clicked for information'),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(40, 5, 20, 5),
                      height: 170,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white30,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(100, 20, 20, 20),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    width: 120,
                                    child: Text(activity.name,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),

                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    width: 200,
                                    child: Text(activity.info,
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    left: 20,
                    top: 15,
                    bottom: 15,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image(
                        width: 110,
                        image: AssetImage(activity.imgUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                ],
              );
            },
        ),
      )
        );

  }
}
