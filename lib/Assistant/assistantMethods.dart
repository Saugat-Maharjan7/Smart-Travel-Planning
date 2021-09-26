import 'package:geolocator/geolocator.dart';
import 'package:smart_travel_planning_appli/Assistant/requestAssistant.dart';

class AssistantMethods {
  static Future<String> searchCoordinateAddress(Position position) async {
    String placeAddress = "";
    String url =
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=AIzaSyBFvLlQ56zwid5GOWP7ZmEqsqq-id3ka4c";

    var response = await RequestAssistant.getRequest(url);

    if (response != "failed") {
      placeAddress = response["results"][0]['formatted_address'];
    }
    return placeAddress;
  }
}
