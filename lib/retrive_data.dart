// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class Fetch extends StatefulWidget {
//
//
//   @override
//   _FetchState createState() => _FetchState();
// }
//
// class _FetchState extends State<Fetch> {
//
//   var firestoreDB = FirebaseFirestore.instance.collection('UserData').snapshots();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
// body: StreamBuilder(
//   stream: firestoreDB,
//   builder: (context, snapshot){
//     if(!snapshot.hasData) return CircularProgressIndicator();
//     return ListView.builder(
//         itemCount: snapshot.data.length,
//         itemBuilder: (context, int index){
//       return Text(snapshot.data.doc[index]['email']);
//     });
//   },
//
// )
//     );
//   }
// }

