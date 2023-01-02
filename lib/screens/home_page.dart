import 'package:cached_network_image/cached_network_image.dart';
import 'package:coivd_19_app/controller/home_screen_controller.dart';
import 'package:coivd_19_app/resources/constrains.dart';
import 'package:coivd_19_app/resources/text_monsterrat.dart';

import 'package:coivd_19_app/widgets/gridview_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pie_chart/pie_chart.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    final String firstName = user!.displayName!.split(" ")[0];
    final String? imageUrl = user.photoURL;

    var controller = Get.put(HomeScreenController());
    return RefreshIndicator(
      onRefresh: () => controller.fetchProucts(),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextMosterrat(
                      text: "Hello, $firstName",
                      fontWeight: FontWeight.w700,
                      size: MediaQuery.of(context).size.width * 0.05,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.015,
                    ),
                    TextMosterrat(
                        text: "Here what's going around the world",
                        size: MediaQuery.of(context).size.width * 0.035,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white54
                            : Colors.black54)
                  ],
                ),
                CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.11,
                  backgroundColor: Colors.purple,
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.10,
                    foregroundImage: CachedNetworkImageProvider(imageUrl!),
                  ),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Obx(
              () => controller.isLoading.value
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                            child: Lottie.asset(
                                "assets/images/progessindicator.json",
                                height:
                                    MediaQuery.of(context).size.width * 0.5)),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PieChart(
                            dataMap: {
                              "total": double.parse(
                                  controller.datas.value.todayCases.toString()),
                              "recovered": double.parse(controller
                                  .datas.value.todayRecovered
                                  .toString()),
                              "death": double.parse(controller
                                  .datas.value.todayDeaths
                                  .toString()),
                            },
                            colorList: controller.pieChartColors,
                            chartType: ChartType.ring,
                            chartRadius:
                                MediaQuery.of(context).size.height * 0.12),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        TextMosterrat(
                          text: "Details",
                          size: MediaQuery.of(context).size.width * 0.05,
                          fontWeight: FontWeight.w700,
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
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisSpacing: MediaQuery.of(context)
                                            .size
                                            .width *
                                        0.02,
                                    mainAxisSpacing:
                                        MediaQuery.of(context).size.height *
                                            0.02,
                                    childAspectRatio: 1,
                                    crossAxisCount: 2),
                            children: [
                              Grids(
                                  color: box1.withOpacity(0.3),
                                  info: controller.datas.value.todayCases
                                      .toString(),
                                  title: "Total\nCases"),
                              Grids(
                                  color: box2.withOpacity(0.2),
                                  info: controller.datas.value.todayRecovered
                                      .toString(),
                                  title: "Todays\nRecovered"),
                              Grids(
                                  color: box3.withOpacity(0.2),
                                  info: controller.datas.value.todayDeaths
                                      .toString(),
                                  title: "Todays\nDeths"),
                              Grids(
                                  color: box4.withOpacity(0.3),
                                  info: controller.datas.value.affectedCountries
                                      .toString(),
                                  title: "Affected\nCountries"),
                              Grids(
                                  color: box4.withOpacity(0.3),
                                  info:
                                      controller.datas.value.active.toString(),
                                  title: "Active\nCases"),
                              Grids(
                                  color: box4.withOpacity(0.3),
                                  info: controller.datas.value.critical
                                      .toString(),
                                  title: "Critical\nCases"),
                            ],
                          ),
                        ),
                      ],
                    ),
            )
          ],
        ),
      ),
    );
  }
}
