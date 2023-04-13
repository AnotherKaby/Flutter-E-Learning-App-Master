import 'package:get/get.dart';
import 'package:flutter_e_learning_app_master/app/data/models/exercise_list_model.dart';
import 'package:flutter_e_learning_app_master/app/data/repository/exercise_repository.dart';
import 'package:flutter_e_learning_app_master/app/widget/snackbar_widget.dart';

class ExerciseController extends GetxController {
  final ExerciseRepository exerciseRepo;

  ExerciseController(this.exerciseRepo);

  String email = Get.arguments['email']!;
  String courseId = Get.arguments['courseId']!;
  String title = Get.arguments['title']!;
  bool isLoading = true;

  @override
  void onInit() async {
    super.onInit();
    getExercise();
  }

  List<ExerciseList> exerciseList = [];

  Future<void> getExercise() async {
    isLoading = true;
    update();
    try {
      Exercise? exercise = await exerciseRepo.getExercise(courseId, email);
      if (exercise != null) {
        exerciseList = exercise.data!;
      }
      isLoading = false;
      update();
    } catch (e) {
      isLoading = false;
      update();
      ErrorSnack.show(message: 'Terjadi Kesalahan');
    }
  }
}
