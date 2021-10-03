import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:smart_travel_planning_appli/Home/recommendedSectionDetails.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:url_launcher/url_launcher.dart';

import 'KApi_service.dart';
import 'Kuser_model.dart';

class KtmDestinationScreen extends StatefulWidget {

  @override
  _KtmDestinationScreenState createState() => _KtmDestinationScreenState();
}

class _KtmDestinationScreenState extends State<KtmDestinationScreen> {

  FetchKUserlist _Kuserlist = FetchKUserlist();


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

              // Packages list
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: FutureBuilder<List<KUserlist>>(
                      future: _Kuserlist.getKuserlist(),
                      builder: (context, snapshot) {
                        var data = snapshot.data;
                        return ListView.builder(
                            itemCount: data?.length,
                            itemBuilder: (context, index) {
                              if (!snapshot.hasData) {
                                return Center(child: CircularProgressIndicator());
                              }
                              return GestureDetector(
                                  onTap: () => print('Package open'),
                                  child: Card(
                                    color: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ListTile(
                                        title: Row(
                                          children: [
                                            Container(
                                              width: 60,
                                              height: 60,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFD8AADD),
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              child: Center(
                                                child: Expanded(
                                                  child: Image.network(
                                                    '${data[index].kimage}',
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 20),
                                            Expanded(
                                                child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        '${data[index].kname.toString()}',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight: FontWeight.w600),
                                                      ),
                                                      SizedBox(height: 10),
                                                      Text(
                                                        '${data[index].kduration.toString()}',
                                                        style: TextStyle(
                                                          color: Colors.white70,
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.w400,
                                                        ),
                                                      ),
                                                      Text(
                                                        '${data[index].kprice.toString()}',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.w400,
                                                        ),
                                                      ),
                                                      ElevatedButton(
                                                        style: ButtonStyle(
                                                          foregroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
                                                        ),
                                                        onPressed: () async {
                                                          dynamic kurls = '${data[index].kurl}';
                                                          if(await canLaunch(kurls)) {
                                                            launch(kurls);
                                                          }else {
                                                            throw 'could not launch';
                                                          }} ,
                                                        child: Text('BOOK NOW',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                        ),),
                                                      )
                                                    ])
                                            )],
                                        ),
                                        // trailing: Text('More Info'),
                                      ),
                                    ),
                                  ));
                            });
                      }),
                ),
              ),

            ],
          ),
        )
    );
  }

}
