import 'package:cached_network_image/cached_network_image.dart';
import 'package:coivd_19_app/resources/text_monsterrat.dart';
import 'package:coivd_19_app/screens/country_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CountriesList extends StatelessWidget {
  const CountriesList(
      {super.key,
      required this.index,
      required this.imageUrl,
      required this.todaysCase,
      required this.countyName,
      required this.cases});
  final String? imageUrl;
  final String countyName;
  final String cases;
  final String todaysCase;
  final int index;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () => Get.to(CountryDetails(
        index: index,
      )),
      child: SizedBox(
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              height: screenHeight * 0.05,
              width: screenHeight * 0.05,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(imageUrl!))),
            ),
            SizedBox(
              width: screenWidth * 0.05,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextMosterrat(
                  text: countyName,
                  size: 14,
                ),
                TextMosterrat(
                  text: cases,
                  fontWeight: FontWeight.w400,
                  size: 12,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
