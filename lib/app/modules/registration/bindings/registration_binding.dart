import 'package:get/get.dart';
import 'package:flutter_e_learning_app_master/app/data/repository/user_repository.dart';

import '../../../data/services/dio_client.dart';
import '../controllers/registration_controller.dart';

class registrationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DioClient>(() => DioClientImpl());
    Get.lazyPut<UserRepository>(() => UserRepositoryImpl(Get.find()));

    Get.lazyPut(
      () => registrationController(userRepository: Get.find()),
    );
  }
}
