import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:smart_travel_planning_appli/Login/login_page.dart';

class RegisterPage extends StatefulWidget {
  static const String id = 'register_page';
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _auth = FirebaseAuth.instance;

  // String userName;
  // String mobileNumber;
  // String email;
  // String password;

  TextEditingController _nameTextEditingController = TextEditingController();
  TextEditingController _emailTextEditingController = TextEditingController();
  TextEditingController _mobileTextEditingController = TextEditingController();
  TextEditingController _passwordTextEditingController =
  TextEditingController();
  TextEditingController _confirmPasswordTextEditingController =
  TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  get usersRef => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF320D36),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'REGISTRATION',
          style: GoogleFonts.roboto(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.only(top: 80),
          padding: EdgeInsets.only(left: 50, right: 20),
          // height: 600,
          width: 400,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  buildTextField(
                      Icons.account_circle, 'Username', false, false),
                  SizedBox(
                    height: 10,
                  ),
                  buildEmailField(Icons.email_rounded, 'E-mail', false, true),
                  SizedBox(
                    height: 10,
                  ),
                  buildPassword(Icons.lock_rounded, 'Password', true),
                  SizedBox(
                    height: 10,
                  ),
                  buildRePassword(
                      Icons.lock_rounded, 'Re-enter Password', true),
                  SizedBox(
                    height: 10,
                  ),
                  buildMobileField(Icons.call, 'Mobile Number', true),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 230,
                    margin: EdgeInsets.only(top: 20),
                    child: RichText(
                      text: TextSpan(
                        text: "On clicking 'Register' you agree to our ",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        children: [
                          TextSpan(
                            // recognizer: ,
                            text: "terms and condition",
                            style: TextStyle(
                              color: Colors.yellowAccent,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 92,
                    height: 40,
                    child: Row(
                      children: <Widget>[
                        TextButton(
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              print(_nameTextEditingController);
                              print(_mobileTextEditingController);
                              print(_emailTextEditingController);
                              print(_passwordTextEditingController);
                              print('New account registered successfully.');
                              Flushbar(
                                title: 'Success',
                                message:
                                'New Account created successfully.',
                                backgroundColor: Colors.blueAccent,
                                duration: Duration(seconds: 5),
                              );
                              Navigator.pop(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return;
                                  },
                                ),
                              );
                            } else {
                              Flushbar(
                                title: 'Invalid',
                                message:
                                'All the field must be filled properly.',
                                backgroundColor: Colors.blueAccent,
                                duration: Duration(seconds: 5),
                              ).show(context);
                              print("Unsuccessful");
                            }
                            try {
                              final User newUser = (await _auth
                                  .createUserWithEmailAndPassword(
                                  email:
                                  _emailTextEditingController.text,
                                  password:
                                  _passwordTextEditingController
                                      .text).then((value){
                                        FirebaseFirestore.instance.collection('UserData').doc(value.user.uid).set(
                                            {'Username': _nameTextEditingController.text.trim(),
                                              "email":
                                              _emailTextEditingController.text.trim(),
                                              "password": _passwordTextEditingController
                                                  .text
                                                  .trim(),
                                              "Re-password":
                                              _confirmPasswordTextEditingController.text
                                                  .trim(),
                                            'mobile': _mobileTextEditingController.text.trim()
                                            });
                              })
                                  .catchError((errorMsg) {}));
                              if (newUser != null) {
                                Map userDataMap = {
                                  "name":
                                  _nameTextEditingController.text.trim(),
                                  "email":
                                  _emailTextEditingController.text.trim(),
                                  "password": _passwordTextEditingController
                                      .text
                                      .trim(),
                                  "Re-password":
                                  _confirmPasswordTextEditingController.text
                                      .trim(),
                                  "Mobile":
                                  _mobileTextEditingController.text.trim(),
                                };

                                usersRef.child(newUser.uid).set(userDataMap);

                                Navigator.pushNamedAndRemoveUntil(
                                    context, LoginPage.id, (route) => false);
                              } else {
                                print('Error occurred');
                              }
                            } catch (e) {
                              print(e);
                            }
                          },
                          child: Center(
                            child: Text(
                              'Register',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.indigoAccent,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      IconData icon, String hintText, bool isPassword, bool isEmail) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextFormField(
        controller: _nameTextEditingController,
        textAlign: TextAlign.center,
        obscureText: isPassword,
        validator: (String value) {
          if (value.isEmpty) {
            return "Please enter username";
          }
          return null;
        },
        onSaved: (value) {
          _nameTextEditingController = value as TextEditingController;
        },
        onChanged: (value) {
          _nameTextEditingController = value as TextEditingController;
        },
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Icon(
            icon,
            color: Colors.black,
            size: 30.0,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget buildEmailField(
      IconData icon, String hintText, bool isPassword1, bool isEmail) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextFormField(
        controller: _emailTextEditingController,
        textAlign: TextAlign.center,
        obscureText: isPassword1,
        validator: (String value) {
          if (value.isEmpty) {
            return "Please enter email";
          }
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return "Please enter valid email";
          }
          return null;
        },
        onSaved: (value) {
          _emailTextEditingController = value as TextEditingController;
        },
        onChanged: (value) {
          _emailTextEditingController = value as TextEditingController;
        },
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Icon(
            icon,
            color: Colors.black,
            size: 30.0,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget buildMobileField(IconData icon, String hintText, bool isNumber) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextFormField(
        controller: _mobileTextEditingController,
        textAlign: TextAlign.center,
        validator: (String value) {
          if (value.isEmpty) {
            return "Please enter Mobile number";
          }
          if (value.length < 10 || value.length > 10) {
            return "Please enter valid Mobile number";
          }
          return null;
        },
        onSaved: (value) {
          _mobileTextEditingController = value as TextEditingController;
        },
        onChanged: (value) {
          _mobileTextEditingController = value as TextEditingController;
        },
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Icon(
            icon,
            color: Colors.black,
            size: 30.0,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget buildPassword(IconData icon, String hintText, bool isPassword) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextFormField(
        textAlign: TextAlign.center,
        controller: _passwordTextEditingController,
        obscureText: isPassword,
        validator: (String value) {
          if (value.isEmpty) {
            return "Please enter password";
          }
          return null;
        },
        onSaved: (value) {
          _passwordTextEditingController = value as TextEditingController;
        },
        onChanged: (value) {
          _passwordTextEditingController = value as TextEditingController;
        },
        keyboardType: isPassword ? TextInputType.text : TextInputType.text,
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Icon(
            icon,
            color: Colors.black,
            size: 30.0,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget buildRePassword(IconData icon, String hintText, bool isPassword) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextFormField(
        textAlign: TextAlign.center,
        controller: _confirmPasswordTextEditingController,
        obscureText: isPassword,
        validator: (String value) {
          if (value.isEmpty) {
            return "Please Re-enter password";
          }
          if (_passwordTextEditingController.text !=
              _confirmPasswordTextEditingController.text) {
            return "Password Mismatch";
          }
          return null;
        },
        onSaved: (value) {
          _confirmPasswordTextEditingController =
          value as TextEditingController;
        },
        onChanged: (value) {
          _confirmPasswordTextEditingController =
          value as TextEditingController;
        },
        keyboardType: isPassword ? TextInputType.text : TextInputType.text,
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Icon(
            icon,
            color: Colors.black,
            size: 30.0,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}