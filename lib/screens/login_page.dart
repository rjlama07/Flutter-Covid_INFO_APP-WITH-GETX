import 'package:coivd_19_app/controller/firebase_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(LogInController());
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              controller.googleSign();
            },
            child: const Text("Sign in with Google")),
      ),
    );
  }
}
