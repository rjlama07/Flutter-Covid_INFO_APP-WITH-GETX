import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  RxBool isDark = false.obs;
  void onChanged(state) {
    if (state) {
      Get.changeTheme(ThemeData.dark());
      isDark.value = true;
    } else {
      Get.changeTheme(ThemeData.light());
      isDark.value = false;
    }
  }
}
