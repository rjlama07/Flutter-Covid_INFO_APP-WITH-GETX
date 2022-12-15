import 'package:flutter/material.dart';

class CountriesList extends StatelessWidget {
  const CountriesList(
      {super.key,
      required this.imageUrl,
      required this.countyName,
      required this.cases});
  final String imageUrl;
  final String countyName;
  final String cases;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              height: 45,
              width: 45,
              child: Image.network(imageUrl)),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.05,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                countyName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                cases,
                style: const TextStyle(fontWeight: FontWeight.w400),
              ),
            ],
          )
        ],
      ),
    );
  }
}
