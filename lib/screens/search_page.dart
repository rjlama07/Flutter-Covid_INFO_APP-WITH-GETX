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
            onChanged: (value) {},
            decoration: InputDecoration(
                suffixIcon: getController.controller.value.text.isEmpty
                    ? null
                    : IconButton(
                        onPressed: () {
                          getController.emptyController();
                        },
                        icon: const Icon(Icons.clear),
                      ),
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
                itemCount: getController.countriesList.length,
                itemBuilder: (context, index) {
                  String name = getController.countriesList[0].country
                      .toString()
                      .toLowerCase();
                  if (getController.controller.value.text.isEmpty) {
                    return CountriesList(
                      imageUrl:
                          getController.countriesList[index].countryInfo?.flag,
                      countyName:
                          getController.countriesList[index].country.toString(),
                      cases:
                          getController.countriesList[index].cases.toString(),
                      todaysCase: getController.countriesList[index].todayCases
                          .toString(),
                    );
                  } else if (getController.controller.value.text
                      .toLowerCase()
                      .contains(name)) {
                    return CountriesList(
                      imageUrl:
                          getController.countriesList[index].countryInfo?.flag,
                      countyName:
                          getController.countriesList[index].country.toString(),
                      cases:
                          getController.countriesList[index].cases.toString(),
                      todaysCase: getController.countriesList[index].todayCases
                          .toString(),
                    );
                  } else {
                    return Container();
                  }
                },
              )))
        // FutureBuilder(
        //   future: countriesAPi.fetchData(),
        //   builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        //     if (snapshot.hasData) {
        //       return
        //     } else {
        //       return Center(

        //       );
        //     }
        //   },
        // )
      ],
    );
  }
}
