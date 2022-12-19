import 'package:coivd_19_app/widgets/reuseable_row.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CountryDetails extends StatelessWidget {
  const CountryDetails(
      {super.key,
      required this.countryName,
      required this.cases,
      required this.todayCase});
  final String countryName;
  final String todayCase;
  final String cases;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade600,
        centerTitle: true,
        title: Text(countryName),
        automaticallyImplyLeading: true,
        leading: InkWell(
            onTap: () => Get.back(), child: const Icon(Icons.arrow_back_ios)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ReuseAbleRow(
              info: cases,
              title: "Total Case",
            ),
            ReuseAbleRow(
              info: todayCase,
              title: "Today's Case",
            ),
            const ReuseAbleRow(
              info: "200000",
              title: "Deaths",
            ),
            const ReuseAbleRow(
              info: "200000",
              title: "Deaths",
            ),
            const ReuseAbleRow(
              info: "200000",
              title: "Deaths",
            ),
          ],
        ),
      ),
    );
  }
}
