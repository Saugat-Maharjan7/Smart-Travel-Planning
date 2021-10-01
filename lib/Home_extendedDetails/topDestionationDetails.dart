import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_travel_planning_appli/models/seasonal_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DetailPage extends StatelessWidget {

  final _pageController = PageController();


  final Season seasons;

  DetailPage({Key key, @required this.seasons})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF320D36),
      body: Container(
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              children: List.generate(
                seasons.images.length,
                    (int index) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(seasons.imgUrl[index]),
                    ),
                  ),
                ),
              ),
            ),

            // Custom button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 14.0),
                  child: IconButton(icon: Icon(Icons.arrow_back,
                    color: Colors.black,
                    size: 30,),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),

            //Content
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 345,
                margin: EdgeInsets.only(left: 28, bottom: 48, right: 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmoothPageIndicator(
                      controller: _pageController,
                      count: seasons.images.length,
                      effect: ExpandingDotsEffect(
                        activeDotColor: Colors.tealAccent,
                        dotColor: Colors.grey,
                        dotHeight: 6,
                        dotWidth: 6,
                        spacing: 4,
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: 19.2),
                      child: Text(
                        seasons.info,
                        maxLines: 2,
                        style: GoogleFonts.roboto(
                            fontSize: 42,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ) ,

                    Padding(
                      padding: EdgeInsets.only(top: 19.2),
                      child: Text(
                        seasons.description,
                        maxLines: 3,
                        style: GoogleFonts.lato(
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                            color: Colors.white
                        ),
                      ),
                    ) ,

                    SizedBox(
                      height: 48,
                    ),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Start from',
                              style: GoogleFonts.lato(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white
                              ),
                            ),
                          ],
                        ),

                        GestureDetector(
                          onTap: () => print("Go to the website"),
                          child: Container(
                            height: 62,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                color: Colors.white
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.only(left: 28, right: 28),
                                child: Text(
                                  'Explore Now',
                                  style: GoogleFonts.lato(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
