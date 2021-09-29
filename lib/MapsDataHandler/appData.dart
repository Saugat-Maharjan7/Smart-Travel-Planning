import 'package:flutter/cupertino.dart';
import 'package:smart_travel_planning_appli/models/mapAddress.dart';

class AppData extends ChangeNotifier{
Address startLocation, destination;

void updateStartLocationAddress(Address startAddress){
  startLocation = startAddress;
  notifyListeners();
 }

void updateDestinationAddress(Address destinationAddress){
  startLocation = destinationAddress;
  notifyListeners();
}

}