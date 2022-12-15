import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:coivd_19_app/resources/api_constrants.dart';
import 'package:http/http.dart' as http;

class CountriesAPi {
  Future<List<dynamic>> fetchData() async {
    var response = await http.get(Uri.parse(ApiUrl.countriesList));
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return data;
    } else {
      debugPrint("Cannot fetch API WORLD STATS");
      throw Exception('Error');
    }
  }
}
