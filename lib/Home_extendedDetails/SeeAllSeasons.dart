import 'package:flutter/material.dart';
import 'package:smart_travel_planning_appli/Home/recommendedSectionDetails.dart';
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
      body: ListView(
        scrollDirection: Axis.vertical,
         children: [

               buildAllSeasons("Illam", "Lush green tea gardens makes illam popular. It has famous tea garden, Antu pond and much to explore.", "images/illam.jpg" ),
               buildAllSeasons('Pokhara', 'Major destination because of its panoramic views, magnificent mountains, lakes.', "images/pokhara.jpg" ),
           buildAllSeasons("Mustang", 'Land Beyond Himalayas: Deepest gorge that goes down three miles between Dhaulagiri and Annapurna mountains.', "images/mustang.jpg" ),
           buildAllSeasons('Lumbini', 'Archaeological site, place of pilgrimage honored as birthplace of Buddha.', "images/lumbini.jpg" ),
           buildAllSeasons("ABC trek", 'An amazing walk through diverse landscape and rich mountains, wild variety of flora and faunas.', "images/abc.jpg"),
           buildAllSeasons('Bardiya National Park', 'Largest national park in lowland Terai. Wide species of animals.', "images/bardiya.jpg" ),
           buildAllSeasons("Janakpur", 'Surrounded by rivers like Dudhmati, Jalad, Rato, Balan and Kamala, Janakpur is famous for its temples and ponds', "images/janakpur.jpg" ),
           buildAllSeasons('Rara Lake', 'The deepest lake and also one of most pristine. Surrounded by green hills on all sides, one can camp by sparkling waters of lake.', "images/rara.jpg" ),

           buildAllSeasons("Chitwan National Park", 'Nestled at foot of himalayas, has particularly rich flora and fauna and is home to asian rhinos,bengal tigers.', 'images/chitwanNP.jpg' ),
           buildAllSeasons('Everest Base Camp', 'Classic trek to base of Mt.Everest. Journey to base of the Everest is more than just a trek.' , "images/ebc.jpg" ),
           buildAllSeasons("Phokshundo Lake", 'Alpine fresh water oligotrophic lake, surrounded by glaciers and famous for spectacular landscapes and most scenic mountain parks.', "images/phokshundo.jpg" ),
           buildAllSeasons('Kalinchwok', 'Named after hill-top temple Kalinchwok Bhagwati. It is blend of both biological and cultural attractions.', "images/kalinchowk.jpg" ),
           buildAllSeasons('Bandipur', 'Hilltop settlement famous for its Newari people and their culture. Also famous for its wildlife. Houses reflect style, architecture and culture.', "images/bandipur.jpg"),
           buildAllSeasons('Nagarkot', 'Scenic hilly town in midst of snow-capped mountains. Offers great views of Himalayas, breathtaking sunrise view.', "images/nagarkot.jpg" ),




         ]

      ),

    );
  }

  Stack buildAllSeasons(title, info, image) {
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
