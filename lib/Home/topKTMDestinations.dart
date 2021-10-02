import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:smart_travel_planning_appli/Home/recommendedSectionDetails.dart';
import 'package:smart_travel_planning_appli/models/activity_model.dart';
import 'package:smart_travel_planning_appli/models/destination_model.dart';
import 'package:carousel_pro/carousel_pro.dart';

class KtmDestinationScreen extends StatefulWidget {

  @override
  _KtmDestinationScreenState createState() => _KtmDestinationScreenState();
}

class _KtmDestinationScreenState extends State<KtmDestinationScreen> {


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
                      tag: AssetImage('images/ktm.jpg'),
                      child:
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Carousel(
                          animationDuration: Duration(milliseconds: 200),
                          dotColor: Colors.white,
                          dotIncreasedColor: Colors.tealAccent,
                          dotSize: 5,
                          dotSpacing: 20,
                          dotBgColor: Colors.transparent,
                          dotPosition: DotPosition.bottomRight,
                          images: [
                            Image.asset('images/ktm.jpg',
                                fit: BoxFit.fill),
                            Image.asset('images/boudha.jpg',
                                fit: BoxFit.fill),
                            Image.asset('images/ktm1.png',
                                fit: BoxFit.fill),
                            Image.asset('images/ktm5.jpg',
                                fit: BoxFit.fill),
                            Image.asset('images/swoyambhu.jpg',
                                fit: BoxFit.fill),
                            Image.asset('images/statue.jpg',
                                fit: BoxFit.fill),

                          ],

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
                              "Kathmandu",
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

              //Put Here
              // Expanded(),


              //Content for down
              //FILTERING AMIT LE GAREKO ETA HALNE
              // Expanded(
              //   child: ListView.builder(
              //     itemCount: widget.destination.activities.length,
              //     itemBuilder: (BuildContext context, int index) {
              //       Activity activity = widget.destination.activities[index];
              //       return Stack(
              //         children: [
              //           GestureDetector(
              //             onTap: () => print('Clicked for navigating'),
              //                 // Navigator.push(
              //                 //     context, MaterialPageRoute(
              //                 //   builder: (context) => DetailPage(),)),
              //             child: Container(
              //               margin: EdgeInsets.fromLTRB(40, 5, 20, 5),
              //               height: 170,
              //               width: double.infinity,
              //               decoration: BoxDecoration(
              //                 color: Colors.white30,
              //                 borderRadius: BorderRadius.circular(20),
              //               ),
              //               child: Padding(
              //                 padding: EdgeInsets.fromLTRB(100, 20, 20, 20),
              //                 child: Column(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   mainAxisAlignment: MainAxisAlignment.center,
              //                   children: [
              //                     Row(
              //                       mainAxisAlignment: MainAxisAlignment
              //                           .spaceBetween,
              //                       crossAxisAlignment: CrossAxisAlignment
              //                           .start,
              //                       children: [
              //                         Container(
              //                           width: 120,
              //                           child: Text(activity.name,
              //                             style: TextStyle(
              //                               fontSize: 22,
              //                               fontWeight: FontWeight.bold,
              //                             ),
              //                             overflow: TextOverflow.ellipsis,
              //                             maxLines: 2,
              //                           ),
              //                         ),
              //                         Text('\Rs.${activity.price}',
              //                           style: TextStyle(
              //                             fontSize: 20,
              //                             fontWeight: FontWeight.w600,
              //                           ),),
              //                       ],
              //                     ),
              //                     _buildRatingStars(activity.rating),
              //                     SizedBox(
              //                       height: 10,
              //                     ),
              //                     Row(
              //                       children: [
              //                         Container(
              //                           width: 70,
              //                           decoration: BoxDecoration(
              //                             color: Colors.blueAccent,
              //                             borderRadius: BorderRadius.circular(
              //                                 10),
              //                           ),
              //                           alignment: Alignment.center,
              //                           child: Text(
              //                             activity.startTimes[0],
              //                           ),
              //                         ),
              //                         SizedBox(width: 10,),
              //                         Container(
              //                           width: 70,
              //                           decoration: BoxDecoration(
              //                             color: Colors.blueAccent,
              //                             borderRadius: BorderRadius.circular(
              //                                 10),
              //                           ),
              //                           alignment: Alignment.center,
              //                           child: Text(
              //                             activity.startTimes[1],
              //                           ),
              //                         ),
              //                       ],
              //                     ),
              //
              //                   ],
              //                 ),
              //               ),
              //             ),
              //           ),
              //
              //           Positioned(
              //             left: 20,
              //             top: 15,
              //             bottom: 15,
              //             child: ClipRRect(
              //               borderRadius: BorderRadius.circular(20),
              //               child: Image(
              //                 width: 110,
              //                 image: AssetImage(activity.imgUrl),
              //                 fit: BoxFit.cover,
              //               ),
              //             ),
              //           ),
              //
              //         ],
              //       );
              //     },
              //   ),
              // ),
            ],
          ),
        )
    );
  }

}