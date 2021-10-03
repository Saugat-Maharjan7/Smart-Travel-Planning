import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';


class SeasonalSummer extends StatefulWidget {

  @override
  _SeasonalSummerState createState() => _SeasonalSummerState();
}

class _SeasonalSummerState extends State<SeasonalSummer> {
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
                    tag: AssetImage('images/summer.jpg'),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image(
                        image: AssetImage('images/summer.jpg'),
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
                            FlutterIcons.ios_sunny_ion,
                            size: 20.0,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Summer',
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
              child: ListView(
                children: [
                  buildSummerSeason("Illam", "Lush green tea gardens makes illam popular. It has famous tea garden, Antu pond and much to explore.", "images/illam.jpg"),
                  buildSummerSeason('Pokhara', 'Major destination because of its panoramic views, magnificent mountains, lakes.', "images/pokhara.jpg" ),
                  buildSummerSeason("Mustang", 'Land Beyond Himalayas: Deepest gorge that goes down three miles between Dhaulagiri and Annapurna mountains.', "images/mustang.jpg" ),
                  buildSummerSeason('Lumbini', 'Archaeological site, place of pilgrimage honored as birthplace of Buddha.', "images/lumbini.jpg" ),
                ]
              ),
            )
          ],
        ),
      ),
    );
  }

  Stack buildSummerSeason(title, info, image
      ) {
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
                                      child: Text(title,
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
                                      child: Text(info,
                                        style: TextStyle(
                                          fontSize: 15,
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
                          image: AssetImage(image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                  ],
                );
  }
}
