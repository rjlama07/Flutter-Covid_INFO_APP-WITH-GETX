import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SettingsController extends GetxController {
  Rx<Brightness> themeMode = Brightness.light.obs;
  RxBool isDark = false.obs;
  final myBox = Hive.box("themeData");

  @override
  void onInit() {
    super.onInit();
    myBox.get(1) != null
        ? isDark.value = myBox.get(1) ? true : false
        : isDark.value = false;
    myBox.get(1) != null
        ? myBox.get(1)
            ? themeMode.value = Brightness.dark
            : themeMode.value = Brightness.light
        : themeMode.value = Brightness.light;
  }

  void onChanged(state) {
    if (state) {
      myBox.put(1, true);
      themeMode.value = Brightness.dark;
      isDark.value = true;
    } else {
      themeMode.value = Brightness.light;
      myBox.put(1, false);
      isDark.value = false;
    }
  }
}
