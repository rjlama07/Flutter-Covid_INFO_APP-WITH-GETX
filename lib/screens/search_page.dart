import 'package:coivd_19_app/controller/search_controller.dart';

import 'package:coivd_19_app/widgets/countries_list.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shimmer/shimmer.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
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
                hintStyle: const TextStyle(fontFamily: "Montserrat"),
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
            ? Expanded(
                child: ListView.builder(
                  itemCount: 24,
                  itemBuilder: (context, index) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey.shade700,
                      highlightColor: Colors.grey.shade100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            title: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: screenHeight * 0.015,
                                  width: screenWidth * 0.6,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  height: screenHeight * 0.01,
                                ),
                                Container(
                                  height: screenHeight * 0.01,
                                  width: screenWidth * 0.2,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            leading: Container(
                              height: screenHeight * 0.04,
                              width: screenWidth * 0.15,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            : Expanded(
                child: RefreshIndicator(
                onRefresh: () => getController.fetchData(),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: getController.searchedCountry.length,
                  itemBuilder: (context, index) {
                    return CountriesList(
                      index: index,
                      imageUrl: getController
                          .searchedCountry[index].countryInfo?.flag,
                      countyName: getController.searchedCountry[index].country
                          .toString(),
                      cases:
                          getController.searchedCountry[index].cases.toString(),
                      todaysCase: getController
                          .searchedCountry[index].todayCases
                          .toString(),
                    );
                  },
                ),
              )))
      ],
    );
  }
}
