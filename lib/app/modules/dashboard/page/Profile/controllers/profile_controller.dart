import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_e_learning_app_master/app/data/repository/user_repository.dart';
import 'package:flutter_e_learning_app_master/app/data/services/firebase_service.dart';

import '../../../../../data/models/user_model.dart';
import '../../../../../data/models/user_regis_model.dart';
import '../../../../../routes/app_pages.dart';
import '../../../../../widget/snackbar_widget.dart';

class ProfileController extends GetxController {
  final FirebaseServices firebase;
  final UserRepository userRepo;
  ProfileController(this.firebase, this.userRepo);

  UserModel userData = Get.arguments;
  final formKey = GlobalKey<FormState>();
  final etName = TextEditingController();
  final etEmail = TextEditingController();
  final etKelas = TextEditingController();
  final etSekolah = TextEditingController();

  final etGender = TextEditingController();
  final _selectedGender = Rx<bool?>(null);
  bool? get selectedGender => _selectedGender.value;
  void onSelectedGender({
    required bool value,
    Function? onSelected,
  }) {
    _selectedGender.value = value;
    etGender.text = (value) ? 'Laki - laki' : 'Perempuan';
    onSelected?.call();
  }

  void onSelectedKelas({
    required String value,
    Function? onSelected,
  }) {
    etKelas.text = value;
    onSelected?.call();
  }

  @override
  void onInit() {
    super.onInit();
    etName.text = userData.data!.userName!;
    etEmail.text = userData.data!.userEmail!;
    etGender.text = userData.data!.userGender!;
    etKelas.text = userData.data!.kelas!;
    etSekolah.text = userData.data!.userAsalSekolah!;
    update();
  }

  Future<void> signOut() async {
    await firebase.signOut();
    Get.offAllNamed(Routes.login);
  }

  Future<void> updateUser() async {
    final email = userData.data!.userEmail!;
    UserRegistration userRegistration = UserRegistration(
      namaLengkap: etName.text,
      email: email,
      namaSekolah: etSekolah.text,
      kelas: etKelas.text,
      gender: etGender.text,
      photoUrl: 'https://res.cloudinary.com/dxrioyfam/image/upload/v1681363756/avatar_ic_bfvmhm.png',
      jenjang: 'SMA',
    );

    try {
      final UserModel? userUpdate = await userRepo.updateUser(userRegistration);
      if (userUpdate != null) {
        userData = userUpdate;
        SuccessSnack.show(message: 'Update Berhasil');
      } else {
        ErrorSnack.show(message: 'Update gagal');
      }
    } catch (e) {
      log(e.toString());
      ErrorSnack.show(message: 'Terjadi Kesalahan');
    }
  }
}
