import 'package:coivd_19_app/controller/nav_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_nav_bar/google_nav_bar.dart';

class GoogleNav extends StatelessWidget {
  const GoogleNav({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(NavBarController());

    return Scaffold(
      body: Obx(() => SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: IndexedStack(
                index: controller.selectedIndex.value,
                children: controller.screens,
              ),
            ),
          )),
      bottomNavigationBar: Container(
        color: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: GNav(
            onTabChange: ((value) {
              controller.selectedIndex.value = value;
            }),
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            activeColor: Colors.white,
            backgroundColor: Colors.black,
            tabBackgroundColor: Colors.grey.shade800,
            gap: 8,
            tabs: const [
              GButton(
                icon: Icons.home,
                text: "Home",
              ),
              GButton(
                icon: Icons.search,
                text: "Sarch",
              ),
              GButton(
                icon: Icons.person,
                text: "Profle",
              ),
            ]),
      ),
    );
  }
}
