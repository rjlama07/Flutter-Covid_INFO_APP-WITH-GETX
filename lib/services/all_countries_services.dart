import 'dart:convert';
import 'package:coivd_19_app/models/world_stats.dart';
import 'package:coivd_19_app/resources/api_constrants.dart';
import 'package:http/http.dart' as http;

class AllCountryServices {
  Future<WorldStats> fetchData() async {
    var response = await http.get(Uri.parse(ApiUrl.wroldStatesApi));
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return WorldStats.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }
}
