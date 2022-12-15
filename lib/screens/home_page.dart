import 'package:coivd_19_app/controller/home_screen_controller.dart';
import 'package:coivd_19_app/models/world_stats.dart';
import 'package:coivd_19_app/resources/constrains.dart';

import 'package:coivd_19_app/widgets/gridview_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pie_chart/pie_chart.dart';

import '../services/world_stats_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    WorldStats worldStats = WorldStats();
    var controller = Get.put(HomeScreenController());
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          const Text(
            "Hello, Rj Lama",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          const Text(
            "Here what's cooking for you",
            style: TextStyle(fontSize: 16, color: Colors.black45),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          FutureBuilder(
            future: worldStats.fetchData(),
            builder: (context, AsyncSnapshot<WorldStatsModel> snapshot) {
              if (snapshot.hasData) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PieChart(
                        dataMap: {
                          "total": double.parse(
                              snapshot.data!.todayCases.toString()),
                          "recovered": double.parse(
                              snapshot.data!.todayRecovered.toString()),
                          "death": double.parse(
                              snapshot.data!.todayDeaths.toString()),
                        },
                        colorList: controller.pieChartColors,
                        chartType: ChartType.ring,
                        chartRadius: MediaQuery.of(context).size.height * 0.15),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    const Text(
                      "Details",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.75,
                      child: GridView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        children: [
                          Grids(
                              color: box1.withOpacity(0.3),
                              info: snapshot.data!.todayCases.toString(),
                              title: "Total\nCases"),
                          Grids(
                              color: box2.withOpacity(0.2),
                              info: snapshot.data!.todayRecovered.toString(),
                              title: "Todays\nRecovered"),
                          Grids(
                              color: box3.withOpacity(0.2),
                              info: snapshot.data!.todayDeaths.toString(),
                              title: "Todays\nDeths"),
                          Grids(
                              color: box4.withOpacity(0.3),
                              info: snapshot.data!.affectedCountries.toString(),
                              title: "Affected\nCountries"),
                          Grids(
                              color: box4.withOpacity(0.3),
                              info: snapshot.data!.active.toString(),
                              title: "Active\nCases"),
                          Grids(
                              color: box4.withOpacity(0.3),
                              info: snapshot.data!.critical.toString(),
                              title: "Critical\nCases"),
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                return Center(
                  child: Lottie.asset("assets/images/progessindicator.json",
                      height: MediaQuery.of(context).size.height * 0.3),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
