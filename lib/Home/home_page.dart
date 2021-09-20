import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_travel_planning_appli/NavBarPages/Noti_page.dart';
import 'package:smart_travel_planning_appli/NavBarPages/location_page.dart';
import 'package:smart_travel_planning_appli/models/destination_model.dart';
import 'package:smart_travel_planning_appli/models/destination_model.dart';
import 'package:smart_travel_planning_appli/models/recommended_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:smart_travel_planning_appli/models/seasonal_model.dart';
import 'package:smart_travel_planning_appli/NavBarPages/profile_page.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
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
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => NotiPage()),
        );
      } else if (_selectedIndex == 3) {
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
                    Icons.notifications,
                  )
                : new Icon(
                    Icons.notifications_none,
                    color: Colors.white,
                  ),
            label: ('Notification'),
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 3
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
      // //appBar ma vako drawer
      // backgroundColor: Color(0xFF320D36),
      // drawer: NavigationDrawerWidget(),
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      // ),
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
                    //CustomNavigationDrawer Search sangae ko wala
                    // Container(
                    //   height: 57.6,
                    //   width: 57.6,
                    //   padding: EdgeInsets.all(18),
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(9.6),
                    //     // color: Colors.blueAccent,
                    //   ),
                    //   child: Icon(
                    //     Icons.view_headline_sharp,
                    //   ),
                    // ),
                    Container(
                      height: 57.6,
                      width: 57.6,
                      padding: EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.6),
                        color: Color(0xFFD8AADD),
                      ),
                      child: Icon(
                        Icons.search,
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
                              color: selected == 1 ? Colors.tealAccent : null,
                              borderRadius: BorderRadius.circular(20)),
                          child: Tab(text: "Popular"),
                        ),
                      ),
                      Container(
                        child: Container(
                          padding: EdgeInsets.only(left: 15, right: 15),
                          decoration: BoxDecoration(
                              color: selected == 2 ? Color(0xFFD8AADD) : null,
                              borderRadius: BorderRadius.circular(20)),
                          child: Tab(text: "Featured"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //_tabbarItem for recommend, popular
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

              //Seasonal Places
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

              Container(
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: destinations.length,
                  itemBuilder: (BuildContext context, int index) {
                    Destination destination = destinations[index];
                    return Container(
                      margin: EdgeInsets.all(10),
                      width: 210,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: <Widget>[
                          Positioned(
                            bottom: 15.0,
                            child: Container(
                              height: 120,
                              width: 200,
                              decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      '${destination.activities.length} places',
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      destination.description,
                                      style: TextStyle(
                                        color: Colors.white,
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
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image(
                                    height: 180,
                                    width: 180,
                                    image: AssetImage(destination.imageUrl),
                                    fit: BoxFit.cover,
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
                                            destination.city,
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
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
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
                (int index) => Container(
                  margin: EdgeInsets.only(right: 28),
                  width: 333,
                  height: 218,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.6),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(recommendations[index].image)),
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
        ],
      ),
    );
  }
}
