import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:smart_travel_planning_appli/Home/CHTPackage/Cuser_model.dart';

class FetchCUserlist {
  var data = [];
  List<CUserlist> results = [];
  String urlList = 'https://jsonkeeper.com/b/2E1E';

  Future<List<CUserlist>> getCuserlist({String query}) async {
    var url = Uri.parse(urlList);
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {

        data = json.decode(response.body);
        results = data.map((e) => CUserlist.fromJson(e)).toList();
        if (query!= null){
          results = results.where((element) => element.cname.toLowerCase().contains((query.toLowerCase()))).toList();
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