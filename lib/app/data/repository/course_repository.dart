import 'dart:developer';

import 'package:flutter_e_learning_app_master/app/data/models/course_list_model.dart';
import 'package:flutter_e_learning_app_master/app/data/utils/app_constant.dart';
import '../services/dio_client.dart';

abstract class CourseRepository {
  Future<CourseListModel?> getCourse(String majorName, String email);
}

class CourseRepositoryImpl implements CourseRepository {
  final DioClient _dioClient;

  CourseRepositoryImpl(this._dioClient);

  @override
  Future<CourseListModel?> getCourse(String majorName, String email) async {
    try {
      final result = await _dioClient.get(
        AppConstant.courseList,
        queryParameters: {"major_name": majorName, "user_email": email},
      );
      CourseListModel res = CourseListModel.fromJson(result);
      if (res.status == 1) {
        return res;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      throw Exception('Get couse list failed: $e');
    }
  }
}
