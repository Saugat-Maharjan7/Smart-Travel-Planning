

import 'package:geolocator/geolocator.dart';
import 'package:smart_travel_planning_appli/Assistant/requestAssistant.dart';
import 'package:smart_travel_planning_appli/DataHandler/appData.dart';
import 'package:smart_travel_planning_appli/models/address.dart';
import 'package:provider/provider.dart';

class AssistantMethods {
  static Future<String> searchCoordinateAddress(Position position, context) async {
    String placeAddress = "";
    String st1,st2,st3,st4;
    String url =
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=AIzaSyBFvLlQ56zwid5GOWP7ZmEqsqq-id3ka4c";

    var response = await RequestAssistant.getRequest(url);

    if (response != "failed") {
      // placeAddress = response["results"][0]['formatted_address'];
      st1 = response["results"][0]['address_components'][3]['long_name'];
      st2 = response["results"][0]['address_components'][4]['long_name'];
      st3 = response["results"][0]['address_components'][5]['long_name'];
      st4 = response["results"][0]['address_components'][6]['long_name'];
      placeAddress = st1+ "," + st2 + "," + st3 + "," + st4;

      Address startingAddress = new Address();
      startingAddress.longitude = position.longitude;
      startingAddress.latitude = position.latitude;
      startingAddress.placeName = placeAddress;

      Provider.of<AppData>(context, listen: false).updateStartLocationAddress(startingAddress);

    }
    return placeAddress;
  }
}
