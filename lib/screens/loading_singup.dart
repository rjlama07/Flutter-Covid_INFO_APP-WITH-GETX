import 'package:coivd_19_app/controller/loading_signip_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoadingSignup extends StatelessWidget {
  const LoadingSignup({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoadingSignupController());
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LottieBuilder.asset(
              "assets/images/google_loading.json",
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            const Text("Please wait...")
          ],
        ),
      ),
    );
  }
}
