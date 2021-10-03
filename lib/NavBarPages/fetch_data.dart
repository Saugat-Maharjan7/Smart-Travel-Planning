import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'profile_page.dart';


class UserManagement {
  storeNewUser(user, context) async {
    var firebaseUser = FirebaseAuth.instance.currentUser;


    FirebaseFirestore.instance
        .collection('UserData')
        .doc(firebaseUser.uid)
        .set({'email': user.email, 'Username': user.uid})
        .then((value) => Navigator.push(
        context, MaterialPageRoute(builder: (context) => ProfilePage())))
        .catchError((e) {
      print(e);
    });
  }
}
