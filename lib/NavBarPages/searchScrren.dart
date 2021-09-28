import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_travel_planning_appli/DataHandler/appData.dart';

class SearchScreen extends StatefulWidget {

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {


  TextEditingController startTextEditingController = TextEditingController();
  TextEditingController destinationTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    String placeAddress = Provider.of<AppData>(context).startLocation ?? "";
    startTextEditingController.text = placeAddress;

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 215.0,
            decoration: BoxDecoration(
              color: Color(0xFF320D36),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 6.0,
                  spreadRadius: 0.5,
                  offset: Offset(0.7,0.7)
                )
              ]
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 25, top: 35, right: 25, bottom: 20),
              child: Column(

                children: [
                  SizedBox(height: 5,),
                  Stack(
                    children: [
                    GestureDetector(
                      onTap: (){
              Navigator.pop(context);
            },
                        child: Icon(Icons.arrow_back,
                        color: Colors.tealAccent,)),
                    Center(
                      child: Text('What to look at?',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.blueAccent,
                      ),),
                    )
                    ],
                  ),
                  SizedBox(height: 16,),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined,
                        size: 20,
                        color: Colors.blueAccent,
                      ),
                      SizedBox(width: 18,),
                      Expanded(child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFD8AADD),
                        borderRadius: BorderRadius.circular(5.0),

                      ),
                      child: Padding(
                        padding: EdgeInsets.all(3),
                        child: TextField(
                          controller: startTextEditingController,
                          decoration: InputDecoration(
                            hintText: 'Start Location',
                            fillColor: Colors.grey[700],
                            filled: true,
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.only(left: 11, top: 8, bottom: 8),
                          ),
                        ),
                      ),
                      ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16,),
                  Row(
                    children: [
                      Icon(Icons.location_on,
                        size: 20,
                        color: Colors.blueAccent,
                      ),
                      SizedBox(width: 18,),
                      Expanded(child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFD8AADD),
                          borderRadius: BorderRadius.circular(5.0),

                        ),
                        child: Padding(
                          padding: EdgeInsets.all(3),
                          child: TextField(
                            controller: destinationTextEditingController,
                            decoration: InputDecoration(
                              hintText: 'Destination',
                              fillColor: Colors.grey[700],
                              filled: true,
                              border: InputBorder.none,
                              isDense: true,
                              contentPadding: EdgeInsets.only(left: 11, top: 8, bottom: 8),
                            ),
                          ),
                        ),
                      ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
