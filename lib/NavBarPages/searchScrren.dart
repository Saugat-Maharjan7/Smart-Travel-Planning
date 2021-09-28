import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_travel_planning_appli/Assistant/ConfigMaps.dart';
import 'package:smart_travel_planning_appli/Assistant/requestAssistant.dart';
import 'package:smart_travel_planning_appli/DataHandler/appData.dart';
import 'package:http/http.dart' as http;
import 'package:smart_travel_planning_appli/models/address.dart';
import 'package:smart_travel_planning_appli/models/placePrediction.dart';



class SearchScreen extends StatefulWidget {

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {


  TextEditingController startTextEditingController = TextEditingController();
  TextEditingController destinationTextEditingController = TextEditingController();

  List<PlacePrediction> placePredictionList = [];

  @override
  Widget build(BuildContext context) {

    String placeAddress = Provider.of<AppData>(context).startLocation ?? "";
    startTextEditingController.text = placeAddress;

    return Scaffold(
      backgroundColor: Color(0xFF320D36),
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
                      Expanded(
                        child: Container(
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
                            onChanged: (val){
                              findPlace(val);
                            },
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
          ),

          //tiles for displaying container
          SizedBox(
            height: 10,
          ),
          (placePredictionList.length > 0)
              ? Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: ListView.separated(
              padding: EdgeInsets.all(0),
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemBuilder: (context,index){
                return PredictionTile(placePrediction: placePredictionList[index] );
              },
              //DividerWidget() vane rakheko thyo
              separatorBuilder: (BuildContext context,int index) => Divider(),
              itemCount: placePredictionList.length),
          )
              : Container(),
        ],
      ),
    );
  }

  void findPlace(String placeName) async{
    if(placeName.length > 1){
      String autoCompleteUrl = "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$placeName&key=$mapKey&components=country:np";

          var res = await RequestAssistant.getRequest(autoCompleteUrl);

      if(res == "failed"){
        return;
      }

      if(res["status"] == "OK"){
        var predictions = res["predictions"];

        var placeList = (predictions as List).map((e) => PlacePrediction.fromJson(e)).toList();

        setState(() {
          placePredictionList = placeList;
        });

      }
    }
  }

}


class PredictionTile extends StatelessWidget {
  final PlacePrediction placePrediction;

   PredictionTile({Key key,this.placePrediction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){
getPlaceAddressDetails(placePrediction.place_id, context);
      },
      child: Container(
        padding: EdgeInsets.all(0),
        child: Column(
          children: [
            SizedBox(
              width: 14,
            ),
            Row(
              children: [
                Icon(Icons.add_location_alt),
                SizedBox(width: 14,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8,),
                      Text(placePrediction.main_text,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 16
                        ),
                      ),
                      SizedBox(height: 3,),
                      Text(placePrediction.secondary_text,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }

  void getPlaceAddressDetails(String placeId, context) async{
    showDialog(context: context,
        builder:(BuildContext context) => Text("Searching the location, Please wait!"),
    );


    String placeDetailsUrl = "https://maps.googlapis.com/maps/api/places/details/json?place_id=$placeId&key=$mapKey";

    var res = await RequestAssistant.getRequest(placeDetailsUrl);

    Navigator.pop(context);

    if(res == "failed"){
      return;
    }
    if(res["status"] == "OK"){
      Address address = Address();
      address.placeName = res["result"]["name"];
      address.placeId = placeId;
      address.latitude = res["result"]["geometry"]["location"]["lat"];
      address.longitude = res["result"]["geometry"]["location"]["lng"];

Provider.of<AppData>(context, listen: false).updateDestinationAddress(address);
print('This is Destination you choosed ::');
print(address.placeName);

Navigator.pop(context, "obtainDirection");
    }
  }
}
