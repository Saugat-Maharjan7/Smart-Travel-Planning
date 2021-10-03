import 'dart:convert';

import 'package:http/http.dart' as http;

import 'PCKUser_model.dart';

class FetchPCKUserlist {
  var data = [];
  List<PCKUserlist> results = [];
  String urlList = 'https://jsonkeeper.com/b/FLL1';

  Future<List<PCKUserlist>> getPCKuserlist({String query}) async {
    var url = Uri.parse(urlList);
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {

        data = json.decode(response.body);
        results = data.map((e) => PCKUserlist.fromJson(e)).toList();
        if (query!= null){
          results = results.where((element) => element.pCKname.toLowerCase().contains((query.toLowerCase()))).toList();
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