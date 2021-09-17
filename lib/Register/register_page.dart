import 'package:flutter/material.dart';
import 'textfield_register.dart';

class RegisterPage extends StatefulWidget {
  static const String id = 'register_page';
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String userName;
  String phoneNumber;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF320D36),
      appBar: AppBar(
        backgroundColor: Color(0xFF320D36),
        title: Text(
          'REGISTRATION',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 30),
          padding: EdgeInsets.only(left: 70, right: 50),
          height: 500,
          width: 400,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                buildTextField(Icons.account_circle, 'UserName', false, false),
                SizedBox(
                  height: 10,
                ),
                buildPhoneField(Icons.call, 'Phone Number', true),
                SizedBox(
                  height: 10,
                ),
                buildTextField(Icons.email_rounded, 'E-mail', false, true),
                SizedBox(
                  height: 10,
                ),
                buildTextField(Icons.lock_rounded, 'Password', true, false),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 230,
                  margin: EdgeInsets.only(top: 20),
                  child: RichText(
                    text: TextSpan(
                      text: "By pressing 'Submit' you agree to our ",
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
                        onPressed: () {
                          print(userName);
                          print(phoneNumber);
                          print(email);
                          print(password);
                          print('New account registered successfully.');
                          Navigator.pop(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return;
                              },
                            ),
                          );
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
    );
  }
}