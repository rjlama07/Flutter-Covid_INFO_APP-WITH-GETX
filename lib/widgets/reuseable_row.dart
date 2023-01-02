import 'package:flutter/material.dart';

import '../resources/text_monsterrat.dart';

class ReuseAbleRow extends StatelessWidget {
  const ReuseAbleRow({super.key, required this.title, required this.info});
  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      color: Colors.grey,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextMosterrat(
                text: title,
                fontWeight: FontWeight.w600,
              ),
              TextMosterrat(
                text: info,
                fontWeight: FontWeight.w500,
              )
            ],
          ),
          const Divider()
        ],
      ),
    );
  }
}
