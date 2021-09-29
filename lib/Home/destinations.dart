import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:smart_travel_planning_appli/models/activity_model.dart';
import 'package:smart_travel_planning_appli/models/destination_model.dart';

class DestinationScreen extends StatefulWidget {

  final Destination destination;

  DestinationScreen({this.destination});

  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {

  _buildRatingStars(int rating){
    String stars = '';
    for (int i=0; i<rating; i++){
      stars += '⭐ ';
    }
    return Text(stars);
  }

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
                            FlutterIcons.location_city_mdi,
                            size: 30.0,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            widget.destination.city,
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
            Expanded(
              child: ListView.builder(
                  itemCount: widget.destination.activities.length,
                  itemBuilder: (BuildContext context, int index){
                    Activity activity = widget.destination.activities[index];
                return Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(40, 5, 20, 5),
                      height: 170,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white30,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding:  EdgeInsets.fromLTRB(100, 20, 20, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 120,
                                  child: Text(activity.name,
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  ),
                                ),
                                Text('\Rs.${activity.price}',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),),
                              ],
                            ),
                            _buildRatingStars(activity.rating),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    activity.startTimes[0],
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Container(
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    activity.startTimes[1],
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),

                    Positioned(
                      left:20,
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
            ),
          ],
        ),
      ),
    );
  }
}
