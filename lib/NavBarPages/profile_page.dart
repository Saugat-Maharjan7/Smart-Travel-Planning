import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_travel_planning_appli/Home/home_page.dart';
import 'package:smart_travel_planning_appli/NavBarPages/settings.dart';
import 'map_page.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  static const String id = 'profile_page';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {
  PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();

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
          Container(
            width: 130,
            height: 130,
            decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Colors.tealAccent,
                ),
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 5,
                      color: Colors.greenAccent.withOpacity(0.1),
                      offset: Offset(0, 3)),
                ],
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: _imageFile == null
                      ? NetworkImage(
                          'https://scontent.fbwa1-1.fna.fbcdn.net/v/t1.6435-9/126142314_3117845208320675_8204778654295153619_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=alcFjFwibRUAX84o7qJ&_nc_ht=scontent.fbwa1-1.fna&oh=b812110a6550cdbc5652fae7d9d4f242&oe=61687853')
                      : FileImage(File(_imageFile.path)),
                )),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: InkWell(
              onTap: () {
                if (Platform.isAndroid) {
                  showModalBottomSheet(
                    context: context,
                    builder: ((builder) => bottomSheet()),
                    // backgroundColor: Colors.redAccent,
                  );
                } else {
                  return showCupertinoModalPopup<ImageSource>(
                    context: context,
                    builder: ((builder) => bottomSheet()),
                  );
                }
                print('Tapped');
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFD8AADD),
                  border: Border.all(
                    width: 1,
                    color: Colors.tealAccent,
                  ),
                ),
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: <Widget>[
          Text(
            'Choose Profile photo',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextButton.icon(
                icon: Icon(Icons.camera_alt),
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
                label: Text(
                  'Camera',
                ),
              ),
              TextButton.icon(
                icon: Icon(Icons.photo),
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
                label: Text('Gallery'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    try {
      final pickedFile = await _picker.getImage(source: source);
      if (pickedFile == null) return;

      setState(() {
        _imageFile = pickedFile;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
}
