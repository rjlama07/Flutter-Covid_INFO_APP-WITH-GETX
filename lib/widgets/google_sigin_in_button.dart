import 'package:flutter/material.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    var brightness = Theme.of(context).brightness;
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: brightness == Brightness.light
                ? Colors.black54
                : Colors.white54,
          ),
          borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/google.png"),
          const Text("  Sign in with Google")
        ],
      ),
    );
  }
}
