import 'package:coivd_19_app/screens/profile_screen.dart';
import 'package:coivd_19_app/screens/search_page.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../screens/home_page.dart';

class NavBarController extends GetxController {
  List<Widget> screens = const [HomePage(), SearchPage(), ProfileScreen()];
  RxInt selectedIndex = 0.obs;
}
