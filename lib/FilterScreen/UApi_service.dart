import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:smart_travel_planning_appli/FilterScreen/Uuser_model.dart';

class FetchUUserlist {
  var data = [];
  List<UUserlist> results = [];
  String urlList = 'https://jsonkeeper.com/b/8TUT';

  Future<List<UUserlist>> getUuserlist({String query}) async {
    var url = Uri.parse(urlList);
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {

        data = json.decode(response.body);
        results = data.map((e) => UUserlist.fromJson(e)).toList();
        if (query!= null){
          results = results.where((element) => element.uname.toLowerCase().contains((query.toLowerCase()))).toList();
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