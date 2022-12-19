import 'dart:async';
import 'package:coivd_19_app/screens/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 2), () {
      nextScreen();
    });
  }

  final User? user = FirebaseAuth.instance.currentUser;

  Future nextScreen() async {
    bool? newState;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    newState = prefs.getBool("newState");
    await prefs.setBool("newState", true);
    if (newState == null || !newState) {
      Get.offAndToNamed('/onBoarding');
    } else {
      if (user != null) {
        Get.offAndToNamed('/bottomNavBar');
      } else if (user == null) {
        Get.off(const LoginPage());
      }
    }
  }
}
