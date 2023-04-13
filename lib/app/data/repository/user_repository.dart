import 'dart:developer';

import 'package:flutter_e_learning_app_master/app/data/models/user_model.dart';
import 'package:flutter_e_learning_app_master/app/data/models/user_regis_model.dart';
import 'package:flutter_e_learning_app_master/app/data/utils/app_constant.dart';
import '../services/dio_client.dart';

abstract class UserRepository {
  Future<UserModel?> getUserByEmail(String email);
  Future<UserModel?> registerUser(UserRegistration model);
  Future<UserModel?> updateUser(UserRegistration model);
}

class UserRepositoryImpl implements UserRepository {
  final DioClient _dioClient;

  UserRepositoryImpl(this._dioClient);

  @override
  Future<UserModel?> getUserByEmail(String email) async {
    try {
      final result = await _dioClient.get(
        AppConstant.user,
        queryParameters: {"email": email},
      );

      UserModel res = UserModel.fromJson(result);

      if (res.status == 1) {
        return res;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('getUserByEmail failed: $e');
    }
  }

  @override
  Future<UserModel?> registerUser(UserRegistration model) async {
    try {
      final result = await _dioClient.post(
        AppConstant.registerUser,
        body: model.toMap(),
      );

      UserModel res = UserModel.fromJson(result);

      if (res.status == 1) {
        return res;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('registerUser failed: $e');
    }
  }

  @override
  Future<UserModel?> updateUser(UserRegistration model) async {
    try {
      final result = await _dioClient.post(
        AppConstant.updateUser,
        body: model.toMap(),
      );
      log(result);

      UserModel res = UserModel.fromJson(result);

      if (res.status == 1) {
        return res;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('update User failed: $e');
    }
  }
}
