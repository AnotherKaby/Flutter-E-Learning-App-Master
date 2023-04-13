import 'package:get/get.dart';
import 'package:flutter_e_learning_app_master/app/data/repository/exercise_repository.dart';

import '../../../data/services/dio_client.dart';
import '../controllers/exercise_controller.dart';

class ExerciseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DioClient>(() => DioClientImpl());
    Get.lazyPut<ExerciseRepository>(() => ExerciseRepositoryImpl(Get.find()));

    Get.lazyPut<ExerciseController>(
      () => ExerciseController(Get.find()),
    );
  }
}
