import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';


class SeasonalAutumn extends StatefulWidget {

  @override
  _SeasonalAutumnState createState() => _SeasonalAutumnState();
}

class _SeasonalAutumnState extends State<SeasonalAutumn> {
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
                    tag: AssetImage('images/autumn.jpg'),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image(
                        image: AssetImage('images/autumn.jpg'),
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
                            FlutterIcons.weather_partly_cloudy_mco,
                            size: 20.0,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Autumn',
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
                    buildAutumnSeason("Janakpur", 'Surrounded by rivers like Dudhmati, Jalad, Rato, Balan and Kamala, Janakpur is famous for its temples and ponds', "images/janakpur.jpg"),
                    buildAutumnSeason( 'Bardiya National Park', 'Largest national park in lowland Terai. Wide species of animals.', "images/bardiya.jpg" ),
                    buildAutumnSeason( "ABC trek", 'An amazing walk through diverse landscape and rich mountains, wild variety of flora and faunas.', "images/abc.jpg"),
                    buildAutumnSeason( 'Rara Lake', 'The deepest lake and also one of most pristine. Surrounded by green hills on all sides, one can camp by sparkling waters of lake.', "images/rara.jpg"),
                  ]
              ),
            )
          ],
        ),
      ),
    );
  }

  Stack buildAutumnSeason(title, info, image
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
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),

      ],
    );
  }

}
