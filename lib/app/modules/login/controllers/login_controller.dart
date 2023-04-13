import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_e_learning_app_master/app/data/models/user_model.dart';
import 'package:flutter_e_learning_app_master/app/data/repository/user_repository.dart';
import 'package:flutter_e_learning_app_master/app/data/services/firebase_service.dart';
import 'package:flutter_e_learning_app_master/app/widget/snackbar_widget.dart';

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final FirebaseServices firebase;
  final UserRepository userRepository;

  LoginController(this.firebase, this.userRepository);

  bool isLoading = false;

  Future<void> onGoogleSignIn() async {
    isLoading = true;
    update();
    try {
      await firebase.signInWithGoogle();
      await isUserRegistered();
      isLoading = false;
      update();
    } on PlatformException catch (e) {
      isLoading = false;
      update();
      ErrorSnack.show(message: e.message.toString());
    }
  }

  Future<void> isUserRegistered() async {
    final String? email = FirebaseAuth.instance.currentUser?.email;
    if (email != null) {
      try {
        final UserModel? userData = await userRepository.getUserByEmail(email);
        if (userData != null) {
          Get.offAllNamed(Routes.dashboard, arguments: userData);
        } else {
          Get.offAllNamed(Routes.registration);
        }
      } catch (e) {
        ErrorSnack.show(message: 'Terjadi Kesalahan');
      }
    } else {
      Get.offAllNamed(Routes.login);
    }
  }

  Future<void> signOut() async {
    await firebase.signOut();
    Get.offAllNamed(Routes.login);
  }
}
