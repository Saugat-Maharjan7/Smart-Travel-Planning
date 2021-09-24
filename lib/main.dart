import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smart_travel_planning_appli/Home/home_page.dart';
import 'package:smart_travel_planning_appli/Login/login_page.dart';
import 'package:smart_travel_planning_appli/Register/register_page.dart';
import 'package:smart_travel_planning_appli/Login/intro_page.dart';
// import 'package:smart_travel_planning_appli/Login/splash.dart';
import 'package:smart_travel_planning_appli/NavBarPages/profile_page.dart';
import 'NavBarPages/location_page.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage())));
  }

  @override
  Widget build(BuildContext context) {
    //MediaQuery
    //  width = MediaQuery.of(context).size.width;
    //  height = MediaQuery.of(context).size.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: IntroPage.id,
      routes: {
        IntroPage.id: (context) => IntroPage(),
        LoginPage.id: (context) => LoginPage(),
        RegisterPage.id: (context) => RegisterPage(),
        HomePage.id: (context) => HomePage(),
        ProfilePage.id: (context) => ProfilePage(),
        LocationPage.id: (context) => LocationPage(),
      },
      // home: Splash(),
    );
  }
}
