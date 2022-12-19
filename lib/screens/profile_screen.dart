import 'package:cached_network_image/cached_network_image.dart';
import 'package:coivd_19_app/controller/firebase_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        ],
      ),
      persistentFooterButtons: [
        ElevatedButton(
            onPressed: () => controller.signOut(), child: const Text("SignOut"))
      ],
    );
  }
}
