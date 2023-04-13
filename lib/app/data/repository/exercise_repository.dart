import 'dart:developer';

import 'package:flutter_e_learning_app_master/app/data/models/exercise_list_model.dart';
import 'package:flutter_e_learning_app_master/app/data/models/question_list_model.dart';
import 'package:flutter_e_learning_app_master/app/data/models/result_model.dart';
import 'package:flutter_e_learning_app_master/app/data/utils/app_constant.dart';
import '../services/dio_client.dart';

abstract class ExerciseRepository {
  Future<Exercise?> getExercise(String courseId, String email);
  Future<Question?> getQuestion(String exerciseId, String email);
  Future<ResultModel?> getResult(String exerciseId, String email);
  Future<Map<String, dynamic>?> submitExercise(Map<String, dynamic> body);
}

class ExerciseRepositoryImpl implements ExerciseRepository {
  final DioClient _dioClient;

  ExerciseRepositoryImpl(this._dioClient);

  @override
  Future<Exercise?> getExercise(String courseId, String email) async {
    try {
      final result = await _dioClient.get(
        AppConstant.exerciseList,
        queryParameters: {"user_email": email, "course_id": courseId},
      );
      Exercise res = Exercise.fromJson(result);
      if (res.status == 1) {
        return res;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      throw Exception('Get exercise list failed: $e');
    }
  }

  @override
  Future<Question?> getQuestion(String exerciseId, String email) async {
    try {
      final result = await _dioClient.post(
        AppConstant.questionList,
        body: {
          'exercise_id': exerciseId,
          'user_email': email,
        },
      );
      Question res = Question.fromJson(result);
      if (res.status == 1) {
        return res;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      throw Exception('Get question list failed: $e');
    }
  }

  @override
  Future<Map<String, dynamic>?> submitExercise(
      Map<String, dynamic> body) async {
    try {
      final result =
          await _dioClient.post(AppConstant.submitExercise, body: body);
      Map<String, dynamic> res = result;
      if (res['status'] == 1) {
        return res;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      throw Exception('Submit exercise failed: $e');
    }
  }

  @override
  Future<ResultModel?> getResult(String exerciseId, String email) async {
    try {
      final result = await _dioClient.get(
        AppConstant.result,
        queryParameters: {"user_email": email, "exercise_id": exerciseId},
      );
      ResultModel res = ResultModel.fromJson(result);
      if (res.status == 1) {
        return res;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      throw Exception('Get result list failed: $e');
    }
  }
}
