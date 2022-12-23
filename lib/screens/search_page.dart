import 'package:coivd_19_app/controller/search_controller.dart';

import 'package:coivd_19_app/widgets/countries_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});
  @override
  Widget build(BuildContext context) {
    final getController = Get.put(SearchConttoller());
    return Column(
      children: [
        Obx(
          () => TextField(
            controller: getController.controller.value,
            onChanged: (value) {
              getController.onChanged(value.toLowerCase());
            },
            decoration: InputDecoration(
                suffixIcon: getController.searchIcon(),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                hintText: "Search with Country Name",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50))),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        Obx(() => getController.isLoading.value
            ? Lottie.asset("assets/images/progessindicator.json",
                height: MediaQuery.of(context).size.height * 0.3)
            : Expanded(
                child: ListView.builder(
                shrinkWrap: true,
                itemCount: getController.searchedCountry.length,
                itemBuilder: (context, index) {
                  return CountriesList(
                    imageUrl:
                        getController.searchedCountry[index].countryInfo?.flag,
                    countyName:
                        getController.searchedCountry[index].country.toString(),
                    cases:
                        getController.searchedCountry[index].cases.toString(),
                    todaysCase: getController.searchedCountry[index].todayCases
                        .toString(),
                  );
                },
              )))
      ],
    );
  }
}
