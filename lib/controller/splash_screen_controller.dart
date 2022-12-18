import 'dart:async';
import 'package:coivd_19_app/screens/login_page.dart';
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

  Future nextScreen() async {
    bool? newState;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    newState = prefs.getBool("newState");
    await prefs.setBool("newState", true);
    if (newState == null || !newState) {
      Get.offAndToNamed('/onBoarding');
    } else {
      // Get.offAndToNamed('/bottomNavBar');
      Get.off(const LoginPage());
    }
  }
}
