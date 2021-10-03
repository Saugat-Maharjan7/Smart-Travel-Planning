import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:smart_travel_planning_appli/FilterScreen/Auser_model.dart';

class FetchAUserlist {
  var data = [];
  List<AUserlist> results = [];
  String urlList = 'https://jsonkeeper.com/b/T9D6';

  Future<List<AUserlist>> getAuserlist({String query}) async {
    var url = Uri.parse(urlList);
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {

        data = json.decode(response.body);
        results = data.map((e) => AUserlist.fromJson(e)).toList();
        if (query!= null){
          results = results.where((element) => element.aname.toLowerCase().contains((query.toLowerCase()))).toList();
        }
      } else {
        print("fetch error");
      }
    } on Exception catch (e) {
      print('error: $e');
    }
    return results;
  }
}