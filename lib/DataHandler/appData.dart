import 'package:flutter/cupertino.dart';
import 'package:smart_travel_planning_appli/models/address.dart';

class AppData extends ChangeNotifier{
Address startLocation;

void updateStartLocationAddress(Address startAddress){
  startLocation = startAddress;
  notifyListeners();
}

}