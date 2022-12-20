import 'package:coivd_19_app/controller/settings_controller.dart';
import 'package:coivd_19_app/screens/home_page.dart';
import 'package:coivd_19_app/screens/login_page.dart';
import 'package:coivd_19_app/screens/onboarding_screen.dart';
import 'package:coivd_19_app/screens/splash_screen.dart';
import 'package:coivd_19_app/widgets/bottomNavBar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  await Hive.openBox("themeData");

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SettingsController());
    return Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Covid track',
        theme: ThemeData(
          brightness: controller.themeMode.value,
          primarySwatch: Colors.blue,
        ),
        getPages: [
          GetPage(name: '/onBoarding', page: () => const Onboarding()),
          GetPage(
            name: '/homescreen',
            page: () => const HomePage(),
          ),
          GetPage(name: '/splash', page: () => const SplashScreen()),
          GetPage(
            name: '/bottomNavBar',
            page: () => const GoogleNav(),
          ),
          GetPage(name: '/login', page: () => const LoginPage())
        ],
        initialRoute: '/splash',
      ),
    );
  }
}
