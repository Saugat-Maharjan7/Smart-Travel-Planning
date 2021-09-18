import 'package:flutter/material.dart';
import 'package:smart_travel_planning_appli/Home/home_page.dart';
import 'package:smart_travel_planning_appli/Login/login_page.dart';
import 'package:smart_travel_planning_appli/Register/register_page.dart';
import 'package:smart_travel_planning_appli/intro_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF320D36),
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Color(0xFF320D36),
      ),
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF320D36),
      ),
      initialRoute: IntroPage.id,
      routes: {
        IntroPage.id: (context) => IntroPage(),
        LoginPage.id: (context) => LoginPage(),
        RegisterPage.id: (context) => RegisterPage(),
        HomePage.id: (context) => HomePage(),
      },
    );
  }
}
