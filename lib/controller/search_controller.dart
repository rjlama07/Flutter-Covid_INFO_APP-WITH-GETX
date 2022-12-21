import 'dart:convert';
import 'package:coivd_19_app/models/all_countries_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../resources/api_constrants.dart';

class SearchConttoller extends GetxController {
  Rx<TextEditingController> controller = TextEditingController().obs;
  RxList<AllCountriesModel> countriesList = <AllCountriesModel>[].obs;
  RxList<int> lar = <int>[].obs;
  RxBool isLoading = true.obs;

  @override
  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void emptyController() {
    controller.value.clear();
  }

  Future<void> fetchData() async {
    var response = await http.get(Uri.parse(ApiUrl.countriesList));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map m in data) {
        countriesList.add(AllCountriesModel.fromJson(m));
      }
      isLoading.value = false;
    } else {
      debugPrint("Cannot fetch API WORLD STATS");
      throw Exception('Error');
    }
  }
}
