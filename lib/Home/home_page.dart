import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_travel_planning_appli/NavigatorBar/Navigation_drawer.dart';
import 'package:smart_travel_planning_appli/models/recommended_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:smart_travel_planning_appli/models/seasonal_model.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  var bottomNavStyle = GoogleFonts.lato(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  //Page Controller
  final _pageController = PageController(viewportFraction: 0.87);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  ),
            label: ('Account'),
          )
        ],
      ),
      backgroundColor: Color(0xFF320D36),
      drawer: NavigationDrawerWidget(),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    //CustomNavigationDrawer
                    Container(
                      height: 57.6,
                      width: 57.6,
                      padding: EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.6),
                        color: Color(0xFFD8AADD),
                      ),
                      child: Icon(
                        Icons.view_headline_sharp,
                      ),
                    ),
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
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 45.6,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              //Custom Tab bar for Category
              Container(
                  height: 30,
                  margin: EdgeInsets.only(left: 14.4, top: 28.8),
                  child: DefaultTabController(
                    length: 4,
                    child: TabBar(
                        labelPadding: EdgeInsets.only(left: 14.4, right: 14.4),
                        indicatorPadding:
                            EdgeInsets.only(left: 14.4, right: 14.4),
                        isScrollable: true,
                        labelColor: Colors.tealAccent,
                        unselectedLabelColor: Colors.grey,
                        labelStyle: GoogleFonts.lato(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                        unselectedLabelStyle: GoogleFonts.lato(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                        tabs: [
                          Tab(
                            child: Container(
                              child: Text('Recommended'),
                            ),
                          ),
                          Tab(
                            child: Container(
                              child: Text('New Destination'),
                            ),
                          ),
                          Tab(
                            child: Container(
                              child: Text('Popular'),
                            ),
                          ),
                          Tab(
                            child: Container(
                              child: Text('Featured'),
                            ),
                          ),
                        ]),
                  )),

              //ListView Widget with PageView
              //Recommended section
              Container(
                height: 218,
                margin: EdgeInsets.only(top: 16),
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

              //DotsIndicator
              Padding(
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

              //Featured Places
              Padding(
                padding: EdgeInsets.only(top: 48, left: 28, right: 28),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Seasonal Best',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: Colors.tealAccent,
                      ),
                    ),
                    Text(
                      'Show all',
                      style: GoogleFonts.lato(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              //Custom Tab bar for Season wise
              Container(
                  height: 30,
                  margin: EdgeInsets.only(left: 14.4, top: 28.8),
                  child: DefaultTabController(
                    length: 5,
                    child: TabBar(
                        labelPadding: EdgeInsets.only(left: 14.4, right: 14.4),
                        indicatorPadding:
                            EdgeInsets.only(left: 14.4, right: 14.4),
                        isScrollable: true,
                        labelColor: Colors.tealAccent,
                        unselectedLabelColor: Colors.grey,
                        labelStyle: GoogleFonts.lato(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                        unselectedLabelStyle: GoogleFonts.lato(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                        tabs: [
                          Tab(
                            child: Container(
                              child: Text('Spring'),
                            ),
                          ),
                          Tab(
                            child: Container(
                              child: Text('Summer'),
                            ),
                          ),
                          Tab(
                            child: Container(
                              child: Text('Monsoon'),
                            ),
                          ),
                          Tab(
                            child: Container(
                              child: Text('Autumn'),
                            ),
                          ),
                          Tab(
                            child: Container(
                              child: Text('Winter'),
                            ),
                          ),
                        ]),
                  )),

              //Season wise (error)
              //Seasonal wise
              // Container(
              //   margin: EdgeInsets.only(top: 28, bottom: 16),
              //   height: 218,
              //   child: ListView.builder(
              //     itemCount: season.length,
              //     padding: EdgeInsets.only(left: 28, right: 12),
              //     scrollDirection: Axis.horizontal,
              //     physics: BouncingScrollPhysics(),
              //     itemBuilder: (context, index) {
              //       return Container(
              //         height: 124,
              //         width: 188,
              //         margin: EdgeInsets.only(right: 16),
              //         decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(9),
              //             image: DecorationImage(
              //               fit: BoxFit.cover,
              //               image: NetworkImage(season[index].image),
              //             )),
              //       );
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
