import 'package:coivd_19_app/controller/firebase_controller.dart';
import 'package:get/get.dart';

class LoadingSignupController extends GetxController {
  var controller = Get.put(LogInController());
  @override
  void onInit() {
    super.onInit();
    controller.googleSign();
  }
}
