import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_travel_planning_appli/Home/home_page.dart';
import 'package:smart_travel_planning_appli/Login/login_page.dart';
import 'package:smart_travel_planning_appli/NavBarPages/settings.dart';
import 'map_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:permission_handler/permission_handler.dart';

class ProfilePage extends StatefulWidget {
  static const String id = 'profile_page';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {

  String myEmail;
  String myUsername;
  String myMobile;

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
                height: 25,
              ),
              imageProfile(),
              SizedBox(
                height: 30,
              ),
              FutureBuilder( future: _fetch(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done)
                    return Text("Loading data...Please wait");

                  return Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text( "Username: $myUsername",
                      style: TextStyle(
                        fontSize: 20,

                      ),),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Email: $myEmail",
                        style: TextStyle(
                          fontSize: 20,
                        ),),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Mobile: $myMobile",
                        style: TextStyle(
                          fontSize: 20,
                        ),)
                    ],
                  );

                },
              ),
              // buildTextField("User Name", "User Name", false),
              // buildTextField("Email", "abcxyz123@email.com", false),
              // buildTextField("Password", "******", true),
              // buildTextField("Mobile Number", "984-------", false),
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
              SizedBox(
                height: 50,
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
                      ? AssetImage(
                          "images/user.png")
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
                  // uploadImage();
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
      final pickedFile = await _picker.pickImage(source: source);
      if (pickedFile == null) return;

      setState(() {
        _imageFile = pickedFile as PickedFile;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  uploadImage() async{
    final _storage = FirebaseStorage.instance;
    final _picker = ImagePicker();
    PickedFile image;

    await Permission.photos.request();

    var permissionStatus = await Permission.photos.status;

    if(permissionStatus.isGranted){
     image = (await _picker.pickImage(source: ImageSource.gallery)) as PickedFile;
     var file = File(image.path);

     if(image != null){

      var snapshot = await _storage.ref().child('folderName/imageName').putFile(file);

      var downloadUrl = snapshot.ref.getDownloadURL();

      setState(() {
        image = downloadUrl as PickedFile;
      });
     }else{
       print('No path received.');
     }
    }else{
      print('Grant permission and try again');
    }

  }

  _fetch() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser;
    if (firebaseUser != null)
      await FirebaseFirestore.instance
          .collection('UserData')
          .doc(firebaseUser.uid)
          .get()
          .then((ds) {

            myUsername = ds.get('Username');
      myEmail = ds.get('email');
      myMobile= ds.get('mobile');
      }

      ).catchError((e) {
        print(e);
      });
  }

}
