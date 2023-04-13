import 'package:flutter_e_learning_app_master/app/modules/dashboard/page/Discus/controllers/discuss_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_e_learning_app_master/app/data/repository/banner_repository.dart';
import 'package:flutter_e_learning_app_master/app/data/repository/course_repository.dart';
import 'package:flutter_e_learning_app_master/app/data/repository/user_repository.dart';
import 'package:flutter_e_learning_app_master/app/data/services/dio_client.dart';
import 'package:flutter_e_learning_app_master/app/data/services/firebase_service.dart';
import 'package:flutter_e_learning_app_master/app/modules/dashboard/page/Profile/controllers/profile_controller.dart';

import '../page/Home/controllers/home_controller.dart';
import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DioClient>(() => DioClientImpl());
    Get.lazyPut<CourseRepository>(() => CourseRepositoryImpl(Get.find()));
    Get.lazyPut<BannerRepository>(() => BannerRepositoryImpl(Get.find()));
    Get.lazyPut<FirebaseServices>(() => FirebaseServices());
    Get.lazyPut<UserRepository>(() => UserRepositoryImpl(Get.find()));

    Get.lazyPut<HomeController>(
      () => HomeController(Get.find(), Get.find()),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(Get.find(), Get.find()),
    );
    Get.lazyPut<DiscussController>(
      () => DiscussController(),
    );
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
  }
}
