import 'package:coivd_19_app/screens/home_page.dart';
import 'package:coivd_19_app/screens/onboarding_screen.dart';
import 'package:coivd_19_app/screens/splash_screen.dart';
import 'package:coivd_19_app/widgets/bottomNavBar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid track',
      theme: ThemeData(
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
        )
      ],
      initialRoute: '/splash',
    );
  }
}
