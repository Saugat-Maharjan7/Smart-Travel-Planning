import 'dart:ui';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_travel_planning_appli/Home/seasonalAutumn.dart';
import 'package:smart_travel_planning_appli/Home/seasonalMonsoon.dart';
import 'package:smart_travel_planning_appli/Home/seasonalWinter.dart';
import 'package:smart_travel_planning_appli/Home/topCHTDestinations.dart';
import 'package:smart_travel_planning_appli/Home/topPKRDestinations.dart';
import 'package:smart_travel_planning_appli/Home_extendedDetails/SeeAllSeasons.dart';
import 'package:smart_travel_planning_appli/Home_extendedDetails/packages.dart';
import 'package:smart_travel_planning_appli/Home_extendedDetails/packages_container.dart';
import 'package:smart_travel_planning_appli/Home_extendedDetails/search.dart';
import 'package:smart_travel_planning_appli/Home/selected_place_screen.dart';
import 'package:smart_travel_planning_appli/Home/topKTMDestinations.dart';
import 'package:smart_travel_planning_appli/Home/seasonalSummer.dart';
import 'package:smart_travel_planning_appli/Home/recommendedSectionDetails.dart';
import 'package:smart_travel_planning_appli/NavBarPages/map_page.dart';
import 'package:smart_travel_planning_appli/models/destination_model.dart';
import 'package:smart_travel_planning_appli/models/package_place.dart';
import 'package:smart_travel_planning_appli/models/recommended_model.dart';
import 'package:smart_travel_planning_appli/models/seasonal_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:smart_travel_planning_appli/NavBarPages/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Home_extendedDetails/suggestionSearchList.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {


  // final _auth = FirebaseAuth.instance;
  // FirebaseUser loggedInUser;
  //
  // @override
  // void initState() {
  //   super.initState();
  //
  //   tabController = TabController(vsync: this, length: 3);
  //   getCurrentUser();
  // }
  //
  // void getCurrentUser() async {
  //   try {
  //     final user = await _auth.currentUser();
  //     if (user != null) {
  //       loggedInUser = user;
  //       print(loggedInUser.email);
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  bool _folded = true;

  int _selectedIndex = 0;

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

  var bottomNavStyle = GoogleFonts.lato(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  var _suggestionTextFieldController = new TextEditingController();

  //Page Controller
  final _pageController = PageController(viewportFraction: 0.87);

  TabController tabController;

  @override
  void initState() {
    tabController = TabController(vsync: this, length: 3);
    super.initState();
  }

  int selected = 0;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF320D36),
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

      body: SafeArea(
        child: Container(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              Container(
                height: 57.6,
                margin: EdgeInsets.only(top: 28.8, left: 28.8, right: 28.8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    AnimatedContainer(
                      duration: Duration(milliseconds: 400),
                      width: _folded ? 56 : 280,
                      height: 56,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Color(0xFFD8AADD),
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(left: 26),
                              child: !_folded
                                  ? AutoCompleteTextField(
                                key: null,
                                clearOnSubmit: false,
                                controller: _suggestionTextFieldController,
                                      suggestions: [suggestionList],
                                      itemFilter: (item, query){
                                  return item.toLowerCase().startsWith(query.toLowerCase());
                                      },
                                itemSorter: (a,b){
                                  return a.compareTo(b);
                                },
                                itemSubmitted: (item){
                                  _suggestionTextFieldController.text = item;
                                },
                                itemBuilder: (context, item){
                                  return Container(
                                    padding: EdgeInsets.all(20),
                                    child: Row(
                                      children: [
                                        Text(item,
                                        style: TextStyle(
                                          color: Colors.blueAccent,
                                        ),)
                                      ],
                                    ),
                                  );
                                },
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: 'Search',
                                        hintStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                        border: InputBorder.none,
                                      ),
                                    )
                                  : null,
                            ),
                          ),
                          AnimatedContainer(
                            duration: Duration(milliseconds: 400),
                            child: Material(
                              type: MaterialType.transparency,
                              child: InkWell(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(_folded ? 32 : 0),
                                    topRight: Radius.circular(32),
                                    bottomLeft:
                                        Radius.circular(_folded ? 32 : 0),
                                    bottomRight: Radius.circular(32)),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Icon(
                                    _folded ? Icons.search : Icons.close,
                                    color: Colors.white,
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    if(_folded = _folded){
                                      showSearch(context: context, delegate: SearchUser());
                                    }

                                    // showSearch(context: context, delegate: SearchUser());
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //Text Widget for title
              Padding(
                padding: EdgeInsets.only(top: 48, left: 28.8),
                child: Text(
                  'Where Next?',
                  style: GoogleFonts.roboto(
                    fontSize: 45.6,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),


              //Custom Tab bar for Category
              Container(
                height: 30,
                margin: EdgeInsets.only(left: 14.4, top: 28.8),
                child: DefaultTabController(
                  length: 3,
                  child: TabBar(
                    controller: tabController,
                    onTap: (value) {
                      setState(() {
                        index = value;
                        selected = value;
                      });
                    },
                    dragStartBehavior: DragStartBehavior.start,
                    indicatorColor: Colors.transparent,
                    labelPadding: EdgeInsets.only(left: 14.4, right: 14.4),
                    indicatorPadding: EdgeInsets.only(left: 14.4, right: 14.4),
                    isScrollable: true,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.grey,
                    labelStyle: GoogleFonts.lato(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                    unselectedLabelStyle: GoogleFonts.lato(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                    tabs: <Container>[
                      Container(
                        child: Container(
                          padding: EdgeInsets.only(left: 15, right: 15),
                          decoration: BoxDecoration(
                              color: selected == 0 ? Colors.blueAccent : null,
                              borderRadius: BorderRadius.circular(20)),
                          child: Tab(text: "Recommended"),
                        ),
                      ),
                      Container(
                        child: Container(
                          padding: EdgeInsets.only(left: 15, right: 15),
                          decoration: BoxDecoration(
                              color: selected == 1 ? Colors.blueAccent : null,
                              borderRadius: BorderRadius.circular(20)),
                          child: Tab(text: "Featured"),
                        ),
                      ),
                      Container(
                        child: Container(
                          padding: EdgeInsets.only(left: 15, right: 15),
                          decoration: BoxDecoration(
                              color: selected == 2 ? Colors.blueAccent : null,
                              borderRadius: BorderRadius.circular(20)),
                          child: Tab(text: "New"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //_tab-barItem for recommend, popular
              Container(
                margin: EdgeInsets.only(top: 20),
                height: 300,
                width: double.infinity,
                child: TabBarView(
                  controller: tabController,
                  children: [
                    _tabbarItem(
                      "NetworkImage(recommendations[index].image)",
                    ),
                    _tabbarItem(
                      "NetworkImage(recommendations[index].image)",
                    ),
                    _tabbarItem(
                      'NetworkImage(recommendations[index].image)',
                    ),
                  ],
                ),
              ),

              //DotsIndicator
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(left: 28, top: 28),
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: recommendations.length,
                    effect: ExpandingDotsEffect(
                      activeDotColor: Colors.tealAccent,
                      dotColor: Colors.grey,
                      dotHeight: 6,
                      dotWidth: 6,
                      spacing: 4,
                    ),
                  ),
                ),
              ),


              //Packages list
              Padding(
                padding: EdgeInsets.only(top: 48, left: 28, right: 28),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Packages',
                      style: GoogleFonts.roboto(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PackageScreen())),
                      child: Text(
                        'Show all',
                        style: GoogleFonts.lato(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //Container for packages
              Container(
                height: 200,
                child: ListView.builder(scrollDirection: Axis.horizontal,
                itemCount: packages.length,
                  itemBuilder: (_, index){
                  return PackageContainer(
                      index: index,
                      package: packages[index]);
                  },
                ),
              ),



              //Top Destination Places
              Padding(
                padding: EdgeInsets.only(top: 48, left: 28, right: 28),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Top Destinations',
                      style: GoogleFonts.roboto(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => print('See All'),
                      child: Text(
                        'Show all',
                        style: GoogleFonts.lato(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 10,
              ),



          // Top Destinations

           Container(
           margin: EdgeInsets.symmetric(vertical: 10),
          height: 280,
          child: ListView(
              scrollDirection: Axis.horizontal,
          children: [
           SizedBox(
          width: 10
          ),

           //Kathmandu Packages
            Container(
        height: 50,
        // width: 200,
        child: GestureDetector(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => KtmDestinationScreen())),
          child: Container(
            margin: EdgeInsets.all(2),
            padding: EdgeInsets.all(5),
            width: 210,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                  Positioned(
              bottom: 5.0,
              child: Container(
                  height: 120,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(15),
                  ),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: Padding(
                            padding:  EdgeInsets.only(top: 24.0),
                            child: Text(
                              'Travel around Kathmandu for exploring exciting places.',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                    ],
              ),
                  ),
              ),
                  ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 6.9,
                    )
                  ]),
              child: Stack(
                children: <Widget>[
              Hero(
                tag: AssetImage('images/ktm.jpg'),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(
                    height: 180,
                    width: 180,
                    image: AssetImage('images/ktm.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
                  Positioned(
                    left: 10,
                    bottom: 10,
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              FlutterIcons.location_city_mdi,
                              size: 10.0,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Kathmandu',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ]
              ),
            )
              ],
            ),
          ),
        ),
      ),

           SizedBox(
            width: 15,
            ),

           //Pokhara Packages
            Container(
        height: 50,
        // width: 200,
        child: GestureDetector(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PkrDestinationScreen())),
          child: Container(
            margin: EdgeInsets.all(2),
            padding: EdgeInsets.all(5),
            width: 210,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  bottom: 5.0,
                  child: Container(
                    height: 120,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 24.0),
                            child: Text(
                              'Visit Pokhara for an amazing and unforgettable adventure.',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0.0, 2.0),
                          blurRadius: 6.9,
                        )
                      ]),
                  child: Stack(
                      children: <Widget>[
                        Hero(
                          tag: AssetImage('images/pkr.jpg'),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image(
                              height: 180,
                              width: 180,
                              image: AssetImage('images/pkr.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 10,
                          bottom: 10,
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Icon(
                                    FlutterIcons.location_city_mdi,
                                    size: 10.0,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Pokhara',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ]
                  ),
                )
              ],
            ),
          ),
        ),
      ),

            SizedBox(
           width: 15,
            ),

           //Chitwan Packages
           Container(
        height: 50,
        // width: 200,
        child: GestureDetector(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ChtDestinationScreen())),
          child: Container(
            margin: EdgeInsets.all(2),
            padding: EdgeInsets.all(5),
            width: 210,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  bottom: 5.0,
                  child: Container(
                    height: 120,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 24.0),
                            child: Text(
                              'Visit Chitwan for chilling and exploring wildlife adventure.',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0.0, 2.0),
                          blurRadius: 6.9,
                        )
                      ]),
                  child: Stack(
                      children: <Widget>[
                        Hero(
                          tag: AssetImage('images/cht.jpg'),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image(
                              height: 180,
                              width: 180,
                              image: AssetImage('images/cht.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 10,
                          bottom: 10,
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Icon(
                                    FlutterIcons.location_city_mdi,
                                    size: 10.0,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Chitwan',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ]
                  ),
                )
              ],
            ),
          ),
        ),
      ),
          ],
          ),
          ),


              // Top Destinations

              // Container(
              //   height: 300,
              //   child: ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemCount: destinations.length,
              //     itemBuilder: (BuildContext context, int index) {
              //       Destination destination = destinations[index];
              //       return GestureDetector(
              //         onTap: () => null,
              //         child: Container(
              //           margin: EdgeInsets.all(10),
              //           width: 210,
              //           child: Stack(
              //             alignment: Alignment.topCenter,
              //             children: <Widget>[
              //               Positioned(
              //                 bottom: 15.0,
              //                 child: Container(
              //                   height: 120,
              //                   width: 200,
              //                   decoration: BoxDecoration(
              //                     color: Colors.blueAccent,
              //                     borderRadius: BorderRadius.circular(10),
              //                   ),
              //                   child: Padding(
              //                     padding: EdgeInsets.all(10.0),
              //                     child: Column(
              //                       mainAxisAlignment: MainAxisAlignment.center,
              //                       crossAxisAlignment: CrossAxisAlignment.center,
              //                       children: <Widget>[
              //                         // Text(
              //                         //   '${destination.activities.length} places',
              //                         //   style: TextStyle(
              //                         //     fontSize: 22,
              //                         //     fontWeight: FontWeight.w600,
              //                         //   ),
              //                         // ),
              //                         Center(
              //                           child: Text(
              //                             destination.description,
              //                             style: TextStyle(
              //                               color: Colors.white,
              //                             ),
              //                           ),
              //                         ),
              //                       ],
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //               Container(
              //                 decoration: BoxDecoration(
              //                     color: Colors.white,
              //                     borderRadius: BorderRadius.circular(20),
              //                     boxShadow: [
              //                       BoxShadow(
              //                         color: Colors.black26,
              //                         offset: Offset(0.0, 2.0),
              //                         blurRadius: 6.9,
              //                       )
              //                     ]),
              //                 child: Stack(
              //                   children: <Widget>[
              //                     Hero(
              //                       tag: destination.imageUrl,
              //                       child: ClipRRect(
              //                         borderRadius: BorderRadius.circular(20),
              //                         child: Image(
              //                           height: 180,
              //                           width: 180,
              //                           image: AssetImage(destination.imageUrl),
              //                           fit: BoxFit.cover,
              //                         ),
              //                       ),
              //                     ),
              //                     Positioned(
              //                       left: 10,
              //                       bottom: 10,
              //                       child: Column(
              //                         crossAxisAlignment:
              //                         CrossAxisAlignment.start,
              //                         children: <Widget>[
              //                           Row(
              //                             children: <Widget>[
              //                               Icon(
              //                                 FlutterIcons.location_city_mdi,
              //                                 size: 10.0,
              //                                 color: Colors.white,
              //                               ),
              //                               SizedBox(
              //                                 width: 5,
              //                               ),
              //                               Text(
              //                                 destination.city,
              //                                 style: TextStyle(
              //                                   color: Colors.white,
              //                                   fontSize: 20,
              //                                   fontWeight: FontWeight.w600,
              //                                   letterSpacing: 1.2,
              //                                 ),
              //                               ),
              //                             ],
              //                           ),
              //                         ],
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // ),

              // Align(
              //   alignment: Alignment.center,
              //   child: Padding(
              //     padding: EdgeInsets.only(left: 28, top: 28),
              //     child: SmoothPageIndicator(
              //       controller: _pageController,
              //       count: destinations.length,
              //       effect: ExpandingDotsEffect(
              //         activeDotColor: Colors.tealAccent,
              //         dotColor: Colors.grey,
              //         dotHeight: 6,
              //         dotWidth: 6,
              //         spacing: 4,
              //       ),
              //     ),
              //   ),
              // ),



              //Seasonal Best


              Padding(
                padding: EdgeInsets.only(top: 48, left: 28, right: 28),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Seasonal Best',
                      style: GoogleFonts.roboto(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),

                    GestureDetector(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SeeAllSeasonal())),
                        child: Text(
                          'Show all',
                          style: GoogleFonts.lato(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),

                  ],
                ),
              ),

              SizedBox(
                height: 10,
              ),

              //Seasonal Best
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 280,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                        width: 10
                    ),

                    //Summer
                    Container(
                      height: 50,
                      // width: 200,
                      child: GestureDetector(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SeasonalSummer())),
                        child: Container(
                          margin: EdgeInsets.all(2),
                          padding: EdgeInsets.all(5),
                          width: 210,
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              Positioned(
                                bottom: 5.0,
                                child: Container(
                                  height: 120,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(top: 30.0),
                                        child: Text(
                                                                    'Mar, Apr, May',
                                                                    style: TextStyle(
                                                                      color: Colors.white,
                                                                      fontSize: 20,
                                                                      fontWeight: FontWeight.bold,
                                                                    ),
                                                                  ),
                                      ),
                                                                SizedBox(
                                                                  height: 5,
                                                                ),
                                                                Text(
                                                                  'Warmer weather, but frequent storms and snowfall at higher altitudes.',
                                                                  style: TextStyle(
                                                                    color: Colors.white,
                                                                    fontSize: 12,
                                                                  ),
                                                                ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        offset: Offset(0.0, 2.0),
                                        blurRadius: 6.9,
                                      )
                                    ]),
                                child: Stack(
                                    children: <Widget>[

                                        Hero(
                                          tag: AssetImage('images/summer.jpg'),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(20),
                                            child: Image(
                                              height: 180,
                                              width: 180,
                                              image: AssetImage('images/summer.jpg'),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      Positioned(
                                        left: 10,
                                        bottom: 10,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Icon(
                                                  FlutterIcons.ios_sunny_ion,
                                                  size: 10.0,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  'Summer',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                    letterSpacing: 1.2,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                        width: 15
                    ),

                    //Monsoon
                    Container(
                      height: 50,
                      // width: 200,
                      child: GestureDetector(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SeasonalMonsoon())),
                        child: Container(
                          margin: EdgeInsets.all(2),
                          padding: EdgeInsets.all(5),
                          width: 210,
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              Positioned(
                                bottom: 5.0,
                                child: Container(
                                  height: 120,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(top: 30.0),
                                          child: Text(
                                            'Jun, Jul, Aug',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'Rain,mist and fog expected almost daily.',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        offset: Offset(0.0, 2.0),
                                        blurRadius: 6.9,
                                      )
                                    ]),
                                child: Stack(
                                    children: <Widget>[

                                      Hero(
                                        tag: AssetImage('images/monsoon.jpg'),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(20),
                                          child: Image(
                                            height: 180,
                                            width: 180,
                                            image: AssetImage('images/monsoon.jpg'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 10,
                                        bottom: 10,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Icon(
                                                  FlutterIcons.ios_rainy_ion,
                                                  size: 10.0,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  'Monsoon',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                    letterSpacing: 1.2,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                        width: 15
                    ),

                    //Autumn
                    Container(
                      height: 50,
                      // width: 200,
                      child: GestureDetector(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SeasonalAutumn())),
                        child: Container(
                          margin: EdgeInsets.all(2),
                          padding: EdgeInsets.all(5),
                          width: 210,
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              Positioned(
                                bottom: 5.0,
                                child: Container(
                                  height: 120,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(top: 30.0),
                                          child: Text(
                                            'Sep, Oct, Nov',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'Best for hiking and trekking.\nFavourable weather condition',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        offset: Offset(0.0, 2.0),
                                        blurRadius: 6.9,
                                      )
                                    ]),
                                child: Stack(
                                    children: <Widget>[

                                      Hero(
                                        tag: AssetImage('images/autumn.jpg'),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(20),
                                          child: Image(
                                            height: 180,
                                            width: 180,
                                            image: AssetImage('images/autumn.jpg'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 10,
                                        bottom: 10,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Icon(
                                                  FlutterIcons.weather_partly_cloudy_mco,
                                                  size: 10.0,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  'Autumn',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                    letterSpacing: 1.2,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                        width: 15
                    ),

                    //Winter
                    Container(
                      height: 50,
                      // width: 200,
                      child: GestureDetector(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SeasonalWinter())),
                        child: Container(
                          margin: EdgeInsets.all(2),
                          padding: EdgeInsets.all(5),
                          width: 210,
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              Positioned(
                                bottom: 5.0,
                                child: Container(
                                  height: 120,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(top: 30.0),
                                          child: Text(
                                            'Dec, Jan, Feb',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'Cold weather occurring snowfall in mountain areas.',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        offset: Offset(0.0, 2.0),
                                        blurRadius: 6.9,
                                      )
                                    ]),
                                child: Stack(
                                    children: <Widget>[

                                      Hero(
                                        tag: AssetImage('images/winter.jpg'),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(20),
                                          child: Image(
                                            height: 180,
                                            width: 180,
                                            image: AssetImage('images/winter.jpg'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 10,
                                        bottom: 10,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Icon(
                                                  FlutterIcons.weather_snowy_rainy_mco,
                                                  size: 10.0,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  'Winter',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                    letterSpacing: 1.2,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

             //Before one Seasonal Best
             //  Container(
             //    height: 300,
             //    child: ListView.builder(
             //      scrollDirection: Axis.horizontal,
             //      itemCount: seasons.length,
             //      itemBuilder: (BuildContext context, int index) {
             //        Season season = seasons[index];
             //          return GestureDetector(
             //            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_)=> SeasonalSummer(season: season,),
             //            ),
             //            ),
             //            child: Container(
             //              margin: EdgeInsets.all(10),
             //              width: 210,
             //              child: Stack(
             //                alignment: Alignment.topCenter,
             //                children: <Widget>[
             //                  Positioned(
             //                    bottom: 15.0,
             //                    child: Container(
             //                      height: 120,
             //                      width: 200,
             //                      decoration: BoxDecoration(
             //                        color: Colors.blueAccent,
             //                        borderRadius: BorderRadius.circular(10),
             //                      ),
             //                      child: Padding(
             //                        padding: EdgeInsets.all(10.0),
             //                        child: Column(
             //                          mainAxisAlignment: MainAxisAlignment.end,
             //                          crossAxisAlignment: CrossAxisAlignment.start,
             //                          children: <Widget>[
             //                            Text(
             //                              season.month,
             //                              style: TextStyle(
             //                                color: Colors.white,
             //                                fontSize: 20,
             //                                fontWeight: FontWeight.bold,
             //                              ),
             //                            ),
             //                            SizedBox(
             //                              height: 5,
             //                            ),
             //                            Text(
             //                              season.info,
             //                              style: TextStyle(
             //                                color: Colors.white,
             //                                fontSize: 12,
             //                              ),
             //                            ),
             //                          ],
             //                        ),
             //                      ),
             //                    ),
             //                  ),
             //                  Container(
             //                    decoration: BoxDecoration(
             //                        color: Colors.white,
             //                        borderRadius: BorderRadius.circular(20),
             //                        boxShadow: [
             //                          BoxShadow(
             //                            color: Colors.black26,
             //                            offset: Offset(0.0, 2.0),
             //                            blurRadius: 6.9,
             //                          )
             //                        ]),
             //                    child: Stack(
             //                      children: <Widget>[
             //                        Hero(
             //                          tag: season.imgUrl,
             //                          child: ClipRRect(
             //                            borderRadius: BorderRadius.circular(20),
             //                            child: Image(
             //                              height: 180,
             //                              width: 180,
             //                              image: AssetImage(season.imgUrl),
             //                              fit: BoxFit.cover,
             //                            ),
             //                          ),
             //                        ),
             //                        Positioned(
             //                          left: 10,
             //                          bottom: 10,
             //                          child: Column(
             //                            crossAxisAlignment:
             //                            CrossAxisAlignment.start,
             //                            children: <Widget>[
             //                              Row(
             //                                children: <Widget>[
             //                                  Text(
             //                                    season.name,
             //                                    style: TextStyle(
             //                                      color: Colors.white,
             //                                      fontSize: 20,
             //                                      fontWeight: FontWeight.w600,
             //                                      letterSpacing: 1.2,
             //                                    ),
             //                                  ),
             //                                ],
             //                              ),
             //                            ],
             //                          ),
             //                        ),
             //                      ],
             //                    ),
             //                  ),
             //                ],
             //              ),
             //            ),
             //          );
             //      },
             //    ),
             //  ),

            ],
          ),
        ),
      ),
    );
  }

  Container _tabbarItem(String images) {
    return Container(
      height: 150,
      width: double.infinity,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            height: 150,
            width: 420,
            child: PageView(
              physics: BouncingScrollPhysics(),
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              children: List.generate(
                recommendations.length,
                (int index) => GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          SelectedPlaceScreen(
                              recommendedModel: recommendations[index]),
                    ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 28),
                    width: 333,
                    height: 218,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.6),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(recommendations[index].image)),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          bottom: 10,
                          right: 12,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(28),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 1,
                                sigmaY: 1,
                              ),
                              child: Container(
                                height: 36,
                                padding: EdgeInsets.only(left: 16, right: 14),
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 9,
                                    ),
                                    Text(
                                      recommendations[index].name,
                                      style: GoogleFonts.aBeeZee(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
