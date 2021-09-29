import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:smart_travel_planning_appli/Assistant/assistantMethods.dart';
import 'package:smart_travel_planning_appli/DataHandler/appData.dart';
import 'package:smart_travel_planning_appli/Home/home_page.dart';
import 'package:smart_travel_planning_appli/NavBarPages/profile_page.dart';
import 'package:smart_travel_planning_appli/NavBarPages/searchScrren.dart';
import 'package:geocoding/geocoding.dart';

class LocationPage extends StatefulWidget {
  static const String id = 'location_page';

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage>
    with TickerProviderStateMixin {
  Completer<GoogleMapController> _controllerGoogleMap = Completer();

  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  List<LatLng> pLineCoordinates = [];
  Set<Polyline> polylineSet = {};

  Position currentPosition;
  var geoLocator = Geolocator();
  double bottomPadding = 0;

  Set<Marker> markersSet = {};
  Set<Circle> circlesSet = {};


  void locatePosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;

    LatLng latLatPosition = LatLng(position.latitude, position.longitude);

    CameraPosition cameraPosition =
        new CameraPosition(target: latLatPosition, zoom: 14);
    newGoogleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

    String address = await AssistantMethods.searchCoordinateAddress(position, context);
    print("This is your Address ::" + address);
  }

  // static final CameraPosition _kbalkumari = CameraPosition(
  //   target: LatLng(27.6695, 85.3408),
  //   zoom: 14.4746,
  // );

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
            padding: EdgeInsets.only(bottom: bottomPadding),
            mapType: MapType.normal,
            myLocationButtonEnabled: true,
            initialCameraPosition: CameraPosition(target: LatLng(27.6695, 85.3408),zoom: 14),
            myLocationEnabled: true,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: true,
            polylines: polylineSet,
            markers: markersSet,
            circles: circlesSet,
            onMapCreated: (GoogleMapController controller) {
              _controllerGoogleMap.complete(controller);

              //Rider call(can remove)
              newGoogleMapController = controller;

              setState(() {
                bottomPadding = 265;
              });

              //Person's location
              locatePosition();
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
                    GestureDetector(
                      onTap: ()async{

                        var res = await Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchScreen()));

                        if(res == "obtainDirection"){
                          await getPlaceDirection();
                        }
                      },
                      child: Container(
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
                              Provider.of<AppData>(context).startLocation != null
                                  ?Provider.of<AppData>(context).startLocation.placeName
                                  : "Start location",
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

  Future<void> getPlaceDirection()async {
    var initialPos = Provider.of<AppData>(context, listen: false).startLocation;
    var finalPos = Provider.of<AppData>(context, listen: false).destination;

    var startLatLng = LatLng(initialPos.latitude, initialPos.longitude);
    var stopLatLng = LatLng(finalPos.latitude, finalPos.longitude);

    showDialog(context: context, builder: (BuildContext context) => Text("Please wait..."),
    );

    var details = await AssistantMethods.obtainDirectionDetails(startLatLng, stopLatLng);

    Navigator.pop(context);

    print("This is the place::");
    print(details.encodedPoints);

    PolylinePoints polylinePoints = PolylinePoints();
    List<PointLatLng> decodedPolylinePointsResult = polylinePoints.decodePolyline(details.encodedPoints);

    pLineCoordinates.clear();

    if(decodedPolylinePointsResult.isNotEmpty){
      decodedPolylinePointsResult.forEach((PointLatLng pointLatLng) {
        pLineCoordinates.add(LatLng(pointLatLng.latitude, pointLatLng.longitude));
      });
    }

    polylineSet.clear();

    setState(() {
      Polyline polyline = Polyline(
        color: Colors.blue,
        polylineId: PolylineId("PolylineID"),
        jointType: JointType.round,
        points: pLineCoordinates,
        width: 5,
        startCap: Cap.roundCap,
        endCap: Cap.roundCap,
        geodesic: true,
      );
      polylineSet.add(polyline);
    });

    LatLngBounds latLngBounds;
    if(startLatLng.latitude > stopLatLng.latitude && startLatLng.longitude > stopLatLng.longitude){
      latLngBounds = LatLngBounds(southwest: stopLatLng, northeast: startLatLng);
    }else if(startLatLng.latitude > stopLatLng.latitude ){
      latLngBounds = LatLngBounds(southwest: LatLng(stopLatLng.latitude, startLatLng.longitude), northeast: LatLng(startLatLng.latitude, stopLatLng.longitude));
    }
    else if(startLatLng.longitude > stopLatLng.longitude ){
      latLngBounds = LatLngBounds(southwest: LatLng(startLatLng.latitude, stopLatLng.longitude), northeast: LatLng(stopLatLng.latitude, startLatLng.longitude));
    }
    else{
      latLngBounds = LatLngBounds(southwest: startLatLng, northeast: stopLatLng);
    }

    newGoogleMapController.animateCamera(CameraUpdate.newLatLngBounds(latLngBounds, 70));

    Marker startLocMarker = Marker(icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    infoWindow: InfoWindow(title: initialPos.placeName, snippet: 'My Position'),
    position: startLatLng,
    markerId: MarkerId('startId'),);

    Marker stopLocMarker = Marker(icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      infoWindow: InfoWindow(title: initialPos.placeName, snippet: 'Final Position'),
      position: stopLatLng,
      markerId: MarkerId('stopId'),);

    setState(() {
      markersSet.add(startLocMarker);
      markersSet.add(stopLocMarker);
    });

    Circle startLocCircle = Circle(
     fillColor: Colors.greenAccent,
     center: startLatLng,
     radius: 12,
     strokeWidth: 4,
     strokeColor: Colors.yellowAccent,
     circleId: CircleId("startId")
    );

    Circle stopLocCircle = Circle(
        fillColor: Colors.blueAccent,
        center: stopLatLng,
        radius: 12,
        strokeWidth: 4,
        strokeColor: Colors.redAccent,
        circleId: CircleId("stopId")
    );

    setState(() {
      circlesSet.add(startLocCircle);
      circlesSet.add(stopLocCircle);
    });

  }
}
