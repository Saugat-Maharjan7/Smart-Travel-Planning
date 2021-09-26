import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smart_travel_planning_appli/Home/home_page.dart';
import 'package:smart_travel_planning_appli/NavBarPages/profile_page.dart';

class LocationPage extends StatefulWidget {
  static const String id = 'location_page';

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage>
    with TickerProviderStateMixin {
  Completer<GoogleMapController> _controllerGoogleMap = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(27.7129336, 85.3044747),
    zoom: 14.4746,
  );

  //Rider call for driver/cab (you can remove)
  GoogleMapController newGoogleMapController;

  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 0) {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else if (_selectedIndex == 1) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LocationPage()),
        );
      } else if (_selectedIndex == 2) {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ProfilePage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFF320D36),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.tealAccent),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: _selectedIndex == 0
                ? new Icon(
                    Icons.home,
                  )
                : new Icon(
                    Icons.home_outlined,
                    color: Colors.white,
                  ),
            label: ('Home'),
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? new Icon(
                    Icons.location_on,
                  )
                : new Icon(
                    Icons.location_on_outlined,
                    color: Colors.white,
                  ),
            label: ('Location'),
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 2
                ? new Icon(
                    Icons.person,
                  )
                : new Icon(
                    Icons.person_outline,
                    color: Colors.white,
                  ),
            label: ('Account'),
          )
        ],
      ),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            myLocationButtonEnabled: true,
            initialCameraPosition: _kGooglePlex,
            myLocationEnabled: true,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: true,
            onMapCreated: (GoogleMapController controller) {
              _controllerGoogleMap.complete(controller);

              //Rider call(can remove)
              newGoogleMapController = controller;
            },
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: Container(
              height: 270.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 16,
                    spreadRadius: 0.5,
                    offset: Offset(0.7, 0.7),
                  ),
                ],
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 6),
                    Text(
                      'Hey There!',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Where Next?',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            blurRadius: 6,
                            spreadRadius: 0.5,
                            offset: Offset(0.7, 0.7),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.search,
                              color: Colors.blueAccent,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'What to look at?,',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: Colors.blueAccent,
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Start location',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 4.0,
                            ),
                            Text(
                              'From ?',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Divider(
                      height: 1,
                      color: Color(0xFF320D36),
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.blueAccent,
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Destination',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 4.0,
                            ),
                            Text(
                              'To ?',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
