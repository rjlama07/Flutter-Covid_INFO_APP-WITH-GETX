import 'package:coivd_19_app/resources/text_monsterrat.dart';
import 'package:flutter/material.dart';

class Grids extends StatelessWidget {
  const Grids(
      {super.key,
      required this.color,
      required this.info,
      required this.title});
  final Color? color;
  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextMosterrat(
                text: title,
                fontWeight: FontWeight.w700,
                size: MediaQuery.of(context).size.height * 0.022),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextMosterrat(
                  text: info,
                  fontWeight: FontWeight.w600,
                  size: MediaQuery.of(context).size.height * 0.025,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
