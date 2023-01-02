import 'package:flutter/material.dart';

class TextMosterrat extends StatelessWidget {
  const TextMosterrat(
      {super.key,
      this.size = 14,
      required this.text,
      this.color,
      this.fontWeight = FontWeight.w600});
  final double size;
  final String text;
  final FontWeight fontWeight;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size == 13 ? 13 : size,
        fontFamily: "Montserrat",
        color: color,
        fontWeight:
            fontWeight == FontWeight.w600 ? FontWeight.w600 : fontWeight,
      ),
    );
  }
}
