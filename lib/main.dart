import 'package:flutter/material.dart';
import 'package:smart_travel_planning_appli/home_page.dart';
import 'package:smart_travel_planning_appli/login_page.dart';
import 'package:smart_travel_planning_appli/register_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: LoginPage.id,
      routes: {
        LoginPage.id: (context) => LoginPage(),
        RegisterPage.id: (context) => RegisterPage(),
        HomePage.id: (context) => HomePage(),
      },
    );
  }
}
