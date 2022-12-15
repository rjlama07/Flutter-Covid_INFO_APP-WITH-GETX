import 'package:coivd_19_app/controller/splash_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashScreenController());
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Lottie.asset('assets/images/splash.json',
                height: MediaQuery.of(context).size.height * 0.3),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          const Text(
            "Covid-19\nTracking Now",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
          )
        ],
      ),
    );
  }
}
