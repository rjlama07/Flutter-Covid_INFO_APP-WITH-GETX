import 'package:coivd_19_app/controller/home_screen_controller.dart';
import 'package:coivd_19_app/controller/search_controller.dart';
import 'package:coivd_19_app/resources/text_monsterrat.dart';
import 'package:coivd_19_app/widgets/reuseable_row.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pie_chart/pie_chart.dart';

class CountryDetails extends StatelessWidget {
  const CountryDetails({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    var controller = Get.find<SearchConttoller>();
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey.shade600,
          centerTitle: true,
          title: Text(controller.searchedCountry[index].country.toString()),
          automaticallyImplyLeading: true,
          leading: InkWell(
              onTap: () => Get.back(), child: const Icon(Icons.arrow_back_ios)),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Obx(
              () => controller.isLoading.value
                  ? Center(
                      child: LottieBuilder.asset(
                      "assets/images/progessindicator.json",
                      height: deviceHeight * 0.2,
                    ))
                  : RefreshIndicator(
                      onRefresh: () => controller.fetchData(),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: deviceHeight * 0.05,
                            ),
                            PieChart(
                                dataMap: {
                                  "total": double.parse(controller
                                      .searchedCountry[index].cases
                                      .toString()),
                                  "recovered": double.parse(controller
                                      .searchedCountry[index].recovered
                                      .toString()),
                                  "death": double.parse(controller
                                      .searchedCountry[index].deaths
                                      .toString()),
                                },
                                colorList: Get.find<HomeScreenController>()
                                    .pieChartColors,
                                chartType: ChartType.ring,
                                chartRadius: deviceHeight * 0.12),
                            SizedBox(
                              height: deviceHeight * 0.03,
                            ),
                            TextMosterrat(
                              text: "Total",
                              size: deviceHeight * 0.03,
                            ),
                            SizedBox(
                              height: deviceHeight * 0.02,
                            ),
                            ReuseAbleRow(
                              info: controller.searchedCountry[index].cases
                                  .toString(),
                              title: "Total Case",
                            ),
                            ReuseAbleRow(
                              info: controller.searchedCountry[index].deaths
                                  .toString(),
                              title: "Total Deaths",
                            ),
                            ReuseAbleRow(
                              info: controller.searchedCountry[index].recovered
                                  .toString(),
                              title: "Total Recovered",
                            ),
                            SizedBox(
                              height: deviceHeight * 0.03,
                            ),
                            TextMosterrat(
                              text: "Today",
                              size: deviceHeight * 0.03,
                            ),
                            ReuseAbleRow(
                              info: controller.searchedCountry[index].todayCases
                                  .toString(),
                              title: "Today's Case",
                            ),
                            ReuseAbleRow(
                              info: controller
                                  .searchedCountry[index].todayDeaths
                                  .toString(),
                              title: "Today's Deaths",
                            ),
                            ReuseAbleRow(
                              info: controller
                                  .searchedCountry[index].todayRecovered
                                  .toString(),
                              title: "Today's Recovered",
                            ),
                            SizedBox(
                              height: deviceHeight * 0.03,
                            ),
                            TextMosterrat(
                              text: "Overall",
                              size: deviceHeight * 0.03,
                            ),
                            ReuseAbleRow(
                              info: controller.searchedCountry[index].active
                                  .toString(),
                              title: "Active",
                            ),
                            ReuseAbleRow(
                              info: controller.searchedCountry[index].critical
                                  .toString(),
                              title: "Critical",
                            ),
                          ],
                        ),
                      )),
            ),
          ),
        ));
  }
}
