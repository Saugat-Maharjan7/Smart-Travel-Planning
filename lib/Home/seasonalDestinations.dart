import 'package:flutter/material.dart';
import 'package:smart_travel_planning_appli/models/season_activity_model.dart';
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
                  child: Hero(
                    tag: widget.season.imgUrl,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image(
                        image: AssetImage(widget.season.imgUrl),
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
                          Text(
                            widget.season.name,
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
                  itemCount: widget.season.activities.length,
                  itemBuilder: (BuildContext context, int index){
                    Activity activity = widget.season.activities[index];
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
                            padding: EdgeInsets.fromLTRB(100, 20, 20, 20),
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
                                  ],
                                ),

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
                                        activity.season[0],

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
                                        activity.season[1],

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
                                        activity.season[2],

                                      ),
                                    ),
                                  ],
                                ),
                              ],
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
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
