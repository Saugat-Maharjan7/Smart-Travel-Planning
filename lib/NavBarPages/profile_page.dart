import 'package:flutter/material.dart';
import 'package:smart_travel_planning_appli/Home/home_page.dart';
import 'package:smart_travel_planning_appli/NavBarPages/settings.dart';
import 'location_page.dart';

class ProfilePage extends StatefulWidget {
  static const String id = 'profile_page';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {
  bool showPassword = false;

  int _selectedIndex = 2;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.tealAccent),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.blueAccent),
            onPressed: () {
              print('Settings clicked');
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => SettingsPage(),
                ),
              );
            },
          ),
        ],
      ),
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
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: <Widget>[
              Text(
                'Profile',
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              imageProfile(),
              SizedBox(
                height: 30,
              ),
              buildTextField("User Name", "Saugat Maharjan", false),
              buildTextField("Email", "sau12@email.com", false),
              buildTextField("Password", "******", true),
              buildTextField("Mobile Number", "984-------", false),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  OutlinedButton(
                    onPressed: () {
                      print('Changes Discarded');
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        fontSize: 19,
                        letterSpacing: 2.2,
                        color: Colors.white,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.red),
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print('Changes Saved');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueAccent,
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                    ),
                    child: Text(
                      'Save',
                      style: TextStyle(
                        fontSize: 19,
                        letterSpacing: 2.2,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
          suffixIcon: isPasswordTextField
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  icon: Icon(
                    Icons.visibility,
                    color: Colors.grey,
                  ),
                )
              : null,
          contentPadding: EdgeInsets.only(bottom: 5),
          labelText: labelText,
          labelStyle: TextStyle(
            fontSize: 25,
            color: Colors.blueAccent,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: TextStyle(
            fontSize: 19,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget imageProfile() {
    return Center(
      child: Stack(
        children: <Widget>[
          CircleAvatar(
            radius: 70,
            backgroundImage: AssetImage("images/pkr.jpg"),
          ),
        ],
      ),
    );
  }
}
