import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:smart_travel_planning_appli/Login/login_page.dart';

class IntroPage extends StatefulWidget {
  static const String id = 'intro_page';

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  List<PageViewModel> getPages() {
    return [
      PageViewModel(
        image: Image.asset('images/stintro.png'),
        title: 'Smart Travel',
        body: 'Your travel assistant.',
        decoration: PageDecoration(
          imageFlex: 1,
          imagePadding: EdgeInsets.only(top: 50),
          descriptionPadding: EdgeInsets.all(16),
          titleTextStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent),
          bodyTextStyle: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        // footer: ElevatedButton(
        //   child: Text(
        //     'Start',
        //     style: TextStyle(
        //       color: Colors.blue,
        //       backgroundColor: Colors.tealAccent,
        //     ),
        //   ),
        //   onPressed: () {
        //     Navigator.of(context).pushReplacement(
        //       MaterialPageRoute(builder: (context) => LoginPage()),
        //     );
        //   },
        // ),
      ),
      PageViewModel(
        image: Image.asset('images/travel.png'),
        title: 'Explore Destinations',
        body: 'Come up with new places to explore',
        decoration: PageDecoration(
          imageFlex: 2,
          descriptionPadding: EdgeInsets.all(16),
          titleTextStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.tealAccent),
          bodyTextStyle: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
      PageViewModel(
        image: Image.asset('images/stpa.png'),
        title: 'Search Places',
        body: 'Where to travel according to the season',
        decoration: PageDecoration(
          imageFlex: 2,
          imagePadding:
              EdgeInsets.only(top: 28, bottom: 50, left: 50, right: 50),
          descriptionPadding: EdgeInsets.all(16),
          titleTextStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent),
          bodyTextStyle: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
      PageViewModel(
        image: Image.asset('images/start.png'),
        title: 'Lets Start',
        body: "Without a further a do.\nLets Go",
        decoration: PageDecoration(
          imageFlex: 2,
          descriptionPadding: EdgeInsets.all(16),
          titleTextStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.tealAccent),
          bodyTextStyle: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        globalBackgroundColor: Color(0xFF320D36),
        dotsDecorator: DotsDecorator(
            activeColor: Colors.tealAccent,
            activeSize: Size(22, 10),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            )),
        pages: getPages(),
        showNextButton: true,
        next: Icon(
          Icons.arrow_forward,
          color: Colors.blue,
        ),
        done: Text(
          "Start",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 20,
          ),
        ),
        onDone: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        },
        skip: Text(
          "Skip",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 20,
          ),
        ),
        showSkipButton: true,
        onSkip: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        },
      ),
    );
  }
}
