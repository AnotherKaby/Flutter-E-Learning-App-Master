import 'dart:developer';

import 'package:flutter_e_learning_app_master/app/data/models/banner_list_model.dart';
import 'package:flutter_e_learning_app_master/app/data/utils/app_constant.dart';
import '../services/dio_client.dart';

abstract class BannerRepository {
  Future<BannerListModel?> getBanner();
}

class BannerRepositoryImpl implements BannerRepository {
  final DioClient _dioClient;

  BannerRepositoryImpl(this._dioClient);

  @override
  Future<BannerListModel?> getBanner() async {
    try {
      final result = await _dioClient.get(
        AppConstant.bannerList,
        queryParameters: {"limit": 5},
      );
      BannerListModel res = BannerListModel.fromJson(result);
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
