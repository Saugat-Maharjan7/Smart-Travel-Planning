import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:smart_travel_planning_appli/Home/home_page.dart';
import '../Register/register_page.dart';
import '../Home/home_page.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flushbar/flushbar.dart';
// import 'package:flutter_facebook_login/flutter_facebook_login.dart';
// import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();

class LoginPage extends StatefulWidget {
  static const String id = 'login_page';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;

  String email;
  String password;

  bool _secureText = true;
  bool isRememberMe = false;
  bool isAuth = false;

  // bool _isLogin = false;
  // Map data;
  // final facebookLogin = FacebookLogin();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    //Detects when user signed in/out
    googleSignIn.onCurrentUserChanged.listen(
      (account) {
        if (account != null) {
          print('User signed in != $account');
          setState(() {
            isAuth = true;
          });
        } else {
          setState(() {
            isAuth = false;
          });
        }
      },
      onError: (err) {
        print('Error signing in: $err');
      },
    );
    //Re-authenticate user app when app is reopened
    googleSignIn.signInSilently(suppressErrors: false).then((account) {
      if (account != null) {
        print('User signed in != $account');
        setState(() {
          isAuth = true;
        });
      } else {
        setState(() {
          isAuth = false;
        });
      }
    }).catchError((err) {
      print('Error signing in : $err');
    });
  }

  login() {
    googleSignIn.signIn();
  }

  logout() {
    googleSignIn.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/stbg.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 90, horizontal: 15),
              constraints: BoxConstraints.expand(),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formkey,
                    child: SizedBox(
                      height: 600.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            height: 50,
                            width: 250,
                            child: Material(
                              elevation: 5.0,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                              color: Colors.white,
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Icon(
                                      Icons.account_circle,
                                      color: Colors.black,
                                      size: 30.0,
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(15.0),
                                          bottomRight: Radius.circular(15.0)),
                                    ),
                                    width: 200,
                                    height: 50,
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: TextFormField(
                                        autofocus: false,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'E-mail',
                                          hintStyle: TextStyle(
                                            color: Colors.grey,
                                          ),
                                          fillColor: Colors.white,
                                          filled: true,
                                        ),
                                        validator: (String value) {
                                          if (value.isEmpty) {
                                            return "Please enter email";
                                          }
                                          if (!RegExp(
                                                  "^[a-zA-Z0-9+_.-]+@[a-zA-z0-9.-]+.[a-z]")
                                              .hasMatch(value)) {
                                            return "Please enter valid email";
                                          }
                                          return null;
                                        },
                                        onSaved: (String value) {
                                          email = value;
                                        },
                                        onChanged: (value) {
                                          email = value;
                                        },
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SingleChildScrollView(
                            child: Container(
                              width: 250,
                              height: 50,
                              child: Material(
                                elevation: 5.0,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                color: Colors.white,
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Icon(
                                        Icons.lock_rounded,
                                        color: Colors.black,
                                        size: 30.0,
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(15.0),
                                            bottomRight: Radius.circular(15.0)),
                                      ),
                                      width: 200,
                                      height: 50,
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: TextFormField(
                                          autofocus: false,
                                          validator: (String value) {
                                            RegExp regex =
                                                new RegExp(r'^.{6,}$');
                                            if (value.isEmpty) {
                                              return 'Please enter password';
                                            }
                                            return null;
                                          },
                                          onSaved: (value) {
                                            password = value;
                                          },
                                          onChanged: (value) {
                                            password = value;
                                          },
                                          decoration: InputDecoration(
                                            hintText: 'Password',
                                            hintStyle: TextStyle(
                                              color: Colors.grey,
                                            ),
                                            fillColor: Colors.white,
                                            filled: true,
                                            border: InputBorder.none,
                                            suffixIcon: IconButton(
                                              icon: Icon(_secureText
                                                  ? Icons.visibility_off
                                                  : Icons.visibility),
                                              onPressed: () {
                                                setState(() {
                                                  _secureText = !_secureText;
                                                });
                                              },
                                            ),
                                          ),
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.black,
                                          ),
                                          obscureText: _secureText,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 50.0),
                                child: Row(
                                  children: [
                                    Checkbox(
                                      checkColor: Colors.black,
                                      value: isRememberMe,
                                      activeColor: Colors.white,
                                      onChanged: (value) {
                                        setState(() {
                                          isRememberMe = !isRememberMe;
                                        });
                                      },
                                    ),
                                    Text(
                                      "Remember Me",
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 50.0),
                                child: TextButton(
                                  onPressed: () {
                                    print('Forgot Password?');
                                  },
                                  child: Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: 116,
                            height: 40,
                            child: Row(
                              children: <Widget>[
                                TextButton.icon(
                                  onPressed: () async {
                                    try {
                                      final newUser = await _auth
                                          .signInWithEmailAndPassword(
                                              email: email, password: password);
                                      if (newUser != null) {
                                        if (_formkey.currentState.validate()) {
                                          Navigator.pushNamed(
                                              context, HomePage.id);
                                          print(email);
                                          print(password);
                                          print('Successful');
                                        } else {
                                          Flushbar(
                                            title: 'Invalid',
                                            message:
                                                'Text-field must be filled properly.',
                                            backgroundColor: Colors.blueAccent,
                                            duration: Duration(seconds: 5),
                                          ).show(context);
                                          print("Unsuccessful");
                                        }
                                        Navigator.pushNamed(
                                            context, HomePage.id);
                                      }
                                    } catch (e) {
                                      print(e);
                                    }
                                  },
                                  icon: Icon(
                                    Icons.login_rounded,
                                    color: Colors.white,
                                  ),
                                  label: Text(
                                    'Log-in',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.indigoAccent,
                                    // textColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 92),
                            padding: EdgeInsets.all(2.0),
                            child: Row(
                              children: <Widget>[
                                TextButton.icon(
                                  onPressed: () {
                                    print('Logged-in with fingerprint');
                                    Navigator.pushNamed(context, HomePage.id);
                                  },
                                  icon: Icon(
                                    Icons.fingerprint,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  label: Text(
                                    'Login with fingerprint',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13.0,
                                    ),
                                  ),
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 65,
                            width: 300,
                            child: Divider(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Not an existing user?',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
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
                                  onPressed: () {
                                    print('Register a new Account?');
                                    Navigator.pushNamed(
                                        context, RegisterPage.id);
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
                                    // textColor: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '- OR -',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SignInButton(
                            Buttons.Google,
                            text: "Sign-in with Google",
                            onPressed: () async {
                              login();
                              print('Signed-in with google');
                            },
                          ),
                          SignInButton(
                            Buttons.Facebook,
                            text: "Sign-in with Facebook",
                            onPressed: () async {
                              // onFBLogin();
                              print('Signed-in with facebook');
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

//   onFBLogin() async {
//     final result = await facebookLogin.logIn(['email']);
//     switch (result.status) {
//       case FacebookLoginStatus.loggedIn:
//         final token = result.accessToken;
//         final response = await http.get(
//             "https://graph.facebook.com/v2.12/me?fields=name,picture,email&access token=$token");
//         final data = json.decode(response.body);
//         print(data);
//         setState(() {
//           _isLogin = true;
//           this.data = data;
//         });
//         break;
//       case FacebookLoginStatus.cancelledByUser:
//         setState(() {
//           return _isLogin;
//         });
//         break;
//       case FacebookLoginStatus.error:
//         setState(() {
//           return _isLogin;
//         });
//         break;
//     }
//   }
}
