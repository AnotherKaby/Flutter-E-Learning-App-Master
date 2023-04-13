import 'package:get/get.dart';
import 'package:flutter_e_learning_app_master/app/routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    Future.delayed(const Duration(milliseconds: 2000))
        .then((value) => Get.offAllNamed(Routes.login));
  }
}
