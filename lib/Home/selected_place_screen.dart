import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_travel_planning_appli/models/recommended_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SelectedPlaceScreen extends StatelessWidget {

  final _pageController = PageController();


  final RecommendedModel recommendedModel;

  SelectedPlaceScreen({Key key, @required this.recommendedModel})
      : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            PageView(
              physics: BouncingScrollPhysics(),
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              children: List.generate(
                recommendedModel.images.length,
                    (int index) => Container(
                  margin: EdgeInsets.only(right: 28),
                  width: 333,
                  height: 218,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.6),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(recommendedModel.images[index]),
                  ),
                ),
              ),
            ),
      ),

            // Custom button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(icon: Icon(Icons.arrow_back,
                  color: Colors.black,
                  size: 30,),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),

            //Content
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
              height: 345,
                  margin: EdgeInsets.only(left: 28, bottom: 48, right: 28),
                child: Column(
                  children: [
                    SmoothPageIndicator(
                      controller: _pageController,
                      count: recommendedModel.images.length,
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
                    recommendedModel.tagLine,
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
                        recommendedModel.description,
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
                      children: [
                        Column(
                          children: [
                            Text('Start from',
                            style: GoogleFonts.lato(
                              fontSize: 19,
                              fontWeight: FontWeight.w500,
                              color: Colors.white
                            ),
                            ),
                            Text('Rs.${recommendedModel.price.toString()}',
                              style: GoogleFonts.lato(
                                  fontSize: 21,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white
                              ),
                            ),
                          ],
                        ),

                        Container(
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
