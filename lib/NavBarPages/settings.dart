import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_travel_planning_appli/Login/login_page.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _auth = FirebaseAuth.instance;
  User loggedInUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    final user = _auth.currentUser;
    try {
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF320D36),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.tealAccent,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: <Widget>[
            Text(
              'Settings',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.blueAccent,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Account',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 4,
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.blueAccent,
                        title: Text('Change Password'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Option1'),
                            Text('Option2'),
                            Text('Option3'),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Close',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      );
                    });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Change Password',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.blueAccent,
                        title: Text('Change Language'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Option1'),
                            Text('Option2'),
                            Text('Option3'),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Close',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      );
                    });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Language',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.blueAccent,
                        title: Text('Change Privacy'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Option1'),
                            Text('Option2'),
                            Text('Option3'),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Close',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      );
                    });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Privacy and Security',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Row(
              children: [
                Icon(
                  Icons.info,
                  color: Colors.blueAccent,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'About',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 4,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    child: Text(

                      "STPA is an application mainly focused on travel planning. Search and view destination and packages according to user's interest.",
                      // overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            Center(
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    )),
                onPressed: () {
                  _auth.signOut();
                  Navigator.pushNamed(
                      context, LoginPage.id);
                },
                icon: Icon(
                  Icons.exit_to_app_rounded,
                  color: Colors.white,
                ),
                label: Text(
                  'Sign Out',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
