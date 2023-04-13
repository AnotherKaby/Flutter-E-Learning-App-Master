import 'dart:developer';

import 'package:get/get.dart';
import 'package:flutter_e_learning_app_master/app/data/models/question_list_model.dart';
import 'package:flutter_e_learning_app_master/app/data/models/result_model.dart';
import 'package:flutter_e_learning_app_master/app/data/repository/exercise_repository.dart';
import 'package:flutter_e_learning_app_master/app/widget/snackbar_widget.dart';

import '../../../routes/app_pages.dart';

class QuestionController extends GetxController {
  final ExerciseRepository exerciseRepo;

  QuestionController(this.exerciseRepo);

  String exerciseId = Get.arguments['exerciseId'];
  String email = Get.arguments['email'];
  bool isLoading = true;
  int currentQuestionIndex = 0;
  int questionLength = 0;
  List<int> answeredQuestion = [];
  String selectedOption = '';
  List<String> questionBankList = [];
  List<String> answerList = [];
  List<QuestionList> questionList = [];
  String score = '0';

  @override
  void onInit() async {
    super.onInit();
    getQUestion();
  }

  Future<void> getQUestion() async {
    isLoading = true;
    update();
    try {
      Question? question = await exerciseRepo.getQuestion(exerciseId, email);
      if (question != null) {
        log(question.message!);
        log(question.data.toString());
        if (question.data!.isNotEmpty) {
          questionList = question.data!;
          questionLength = question.data!.length;
          for (var i = 0; i < questionLength; i++) {
            questionBankList.add(question.data![i].bankQuestionId!);
            answerList.add('');
          }
          SuccessSnack.show(message: 'Selamat Mengerjakan!!!');
        } else {
          ErrorSnack.show(message: 'Belum ada soal yang bisa dikerjakan!!!');
        }
      }
      isLoading = false;
      update();
    } catch (e) {
      isLoading = false;
      update();
      ErrorSnack.show(message: 'Terjadi Kesalahan');
    }
  }

  Future<void> submit() async {
    isLoading = true;
    Get.back();
    update();
    try {
      var body = {
        "user_email": email,
        "exercise_id": exerciseId,
        "bank_question_id": questionBankList,
        "student_answer": answerList
      };
      var submit = await exerciseRepo.submitExercise(body);
      if (submit != null) {
        SuccessSnack.show(message: 'Terima kasih!!!');
        ResultModel? result = await exerciseRepo.getResult(exerciseId, email);

        if (result != null) {
          score = result.data!.result!.jumlahScore.toString();
          Get.toNamed(Routes.result);
          update();
          await Future.delayed(const Duration(seconds: 3));
          Get.back();
          Get.back();
          update();
        }
      }
      isLoading = false;
      update();
    } catch (e) {
      log(e.toString());
      isLoading = false;
      update();
      ErrorSnack.show(message: 'Terjadi Kesalahan');
    }
  }
}
