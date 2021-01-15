import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:practice/constants/strings.dart';
import 'package:practice/models/countryInfo.dart';

// ignore: camel_case_types
class API_Manager {
  Future<Model> getInfo() async {
    var client = http.Client();
    var infoModel;
    try {
      var response = await client.get(Strings.news_url);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        infoModel = Model.fromJson(jsonMap);
      }
    } catch (Exception) {
      return infoModel;
    }
    return infoModel;
  }
}
