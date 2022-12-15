import 'package:coivd_19_app/controller/home_screen_controller.dart';
import 'package:coivd_19_app/resources/constrains.dart';
import 'package:coivd_19_app/widgets/gridview_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeScreenController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
        PieChart(
            dataMap: const {
              "total": 20,
              "recovered": 13,
              "death": 8,
            },
            colorList: controller.pieChartColors,
            chartType: ChartType.ring,
            chartRadius: MediaQuery.of(context).size.height * 0.15),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        const Text(
          "Details",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: GridView(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            children: [
              Grids(
                  color: box1.withOpacity(0.3), info: "30000", title: "Deaths"),
              Grids(
                  color: box2.withOpacity(0.2), info: "30000", title: "Deaths"),
              Grids(
                  color: box3.withOpacity(0.2), info: "30000", title: "Deaths"),
              Grids(
                  color: box4.withOpacity(0.3), info: "30000", title: "Deaths"),
            ],
          ),
        ),
      ],
    );
  }
}
