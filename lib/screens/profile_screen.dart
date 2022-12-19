import 'package:cached_network_image/cached_network_image.dart';
import 'package:coivd_19_app/controller/firebase_controller.dart';
import 'package:coivd_19_app/controller/settings_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsController = Get.find<SettingsController>();
    final User? user = FirebaseAuth.instance.currentUser;
    final String? imageUrl = user!.photoURL;
    var controller = Get.put(LogInController());
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
          ),
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(imageUrl!),
                  radius: 60,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Text(
                  user.displayName!,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          const Text(
            "Settings",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Dark Mode"),
              Obx(() => Switch(
                  value: settingsController.isDark.value,
                  onChanged: ((value) {
                    settingsController.onChanged(value);
                  })))
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.025,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Log Out"),
              InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Are you sure you want to logout?"),
                          actions: [
                            TextButton(
                                onPressed: () => Get.back(),
                                child: const Text("No")),
                            TextButton(
                                onPressed: () => controller.signOut(),
                                child: const Text(
                                  "Yes",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                          ],
                        );
                      },
                    );
                  },
                  child: const Icon(
                    Iconsax.logout,
                    color: Colors.red,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
