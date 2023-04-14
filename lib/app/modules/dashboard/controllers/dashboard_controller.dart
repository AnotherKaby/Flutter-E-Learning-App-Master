import 'package:flutter_e_learning_app_master/app/data/models/user_model.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final selectedNavIndex = 0.obs;
  UserModel userData = Get.arguments;

  void navigateTo(int index) {
    selectedNavIndex.value = index;
  }
  bool isOnline = true;
}
