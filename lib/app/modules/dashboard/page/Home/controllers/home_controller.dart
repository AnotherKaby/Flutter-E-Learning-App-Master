import 'package:get/get.dart';
import 'package:flutter_e_learning_app_master/app/data/models/banner_list_model.dart';
import 'package:flutter_e_learning_app_master/app/data/models/course_list_model.dart';
import 'package:flutter_e_learning_app_master/app/data/models/user_model.dart';
import 'package:flutter_e_learning_app_master/app/data/repository/banner_repository.dart';
import 'package:flutter_e_learning_app_master/app/data/repository/course_repository.dart';

import '../../../../../widget/snackbar_widget.dart';

class HomeController extends GetxController {
  final CourseRepository courseRepo;
  final BannerRepository bannerRepo;

  HomeController(this.bannerRepo, this.courseRepo);

  @override
  void onInit() async {
    super.onInit();
    getCourseList();
    getBannerList();
  }

  UserModel userData = Get.arguments;
  List<CourseList> courseList = [];
  List<BannerList> bannerList = [];
  bool isLoading = true;

  Future<void> getCourseList() async {
    isLoading = true;
    update();
    try {
      CourseListModel? courseData =
          await courseRepo.getCourse('IPA', userData.data!.userEmail!);
      if (courseData != null) {
        courseList = courseData.data!;
      } else {
        ErrorSnack.show(message: 'Terjadi Kesalahan');
      }
      isLoading = false;
      update();
    } catch (e) {
      isLoading = false;
      update();
      ErrorSnack.show(message: 'Terjadi Kesalahan');
    }
  }

  Future<void> getBannerList() async {
    try {
      BannerListModel? bannerData = await bannerRepo.getBanner();
      if (bannerData != null) {
        bannerList = bannerData.data!;
        update();
      } else {
        ErrorSnack.show(message: 'Terjadi Kesalahan');
      }
    } catch (e) {
      ErrorSnack.show(message: 'Terjadi Kesalahan');
    }
  }
}
