import 'package:coivd_19_app/controller/firebase_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(LogInController());
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  const Text(
                    "COVID-19 Tracker",
                    style: TextStyle(fontSize: 24),
                  ),
                  LottieBuilder.asset("assets/images/login.json"),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        controller.googleSign();
                      },
                      child: const Text("Sign in with Google")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
