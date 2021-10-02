import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_travel_planning_appli/Home/home_page.dart';
import 'package:smart_travel_planning_appli/NavBarPages/settings.dart';
import 'map_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
              buildTextField("User Name", "User Name", false),
              buildTextField("Email", "abcxyz123@email.com", false),
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
                          'data:image/png;base64,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')
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
