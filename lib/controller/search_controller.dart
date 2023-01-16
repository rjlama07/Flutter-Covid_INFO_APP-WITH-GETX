import 'dart:convert';
import 'package:coivd_19_app/models/all_countries_model.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../resources/api_constrants.dart';

class SearchConttoller extends GetxController {
  Rx<TextEditingController> controller = TextEditingController().obs;
  List<AllCountriesModel> countriesList = <AllCountriesModel>[];
  RxList<AllCountriesModel> searchedCountry = <AllCountriesModel>[].obs;
  RxBool isLoading = true.obs;
  RxBool istyping = false.obs;

  @override
  @override
  void onInit() {
    super.onInit();
    fetchData();
    searchedCountry.value = countriesList;
  }

  @override
  void dispose() {
    super.dispose();
    controller;
  }

  Widget searchIcon() {
    return !istyping.value
        ? const Icon(Icons.search)
        : IconButton(
            onPressed: () {
              emptyController();
              istyping.value = false;
            },
            icon: const Icon(Icons.close));
  }

  void emptyController() {
    controller.value.clear();
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    searchedCountry.value = countriesList;
  }

  Future<void> fetchData() async {
    countriesList.clear();
    isLoading.value = true;
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

  void onChanged(String countryname) {
    List<AllCountriesModel> result = <AllCountriesModel>[];
    if (countryname.isEmpty) {
      istyping.value = false;
      result = countriesList;
    } else {
      istyping.value = true;
      result = countriesList
          .where((element) =>
              element.country.toString().toLowerCase().startsWith(countryname))
          .toList();
    }
    searchedCountry.value = result;
  }
}
