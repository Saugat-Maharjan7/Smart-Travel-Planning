import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Kuser_model.dart';

class FetchKUserlist {
  var data = [];
  List<KUserlist> results = [];
  String urlList = 'https://jsonkeeper.com/b/5HAD';

  Future<List<KUserlist>> getKuserlist({String query}) async {
    var url = Uri.parse(urlList);
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {

        data = json.decode(response.body);
        results = data.map((e) => KUserlist.fromJson(e)).toList();
        if (query!= null){
          results = results.where((element) => element.kname.toLowerCase().contains((query.toLowerCase()))).toList();
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