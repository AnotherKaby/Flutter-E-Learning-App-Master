import 'dart:developer';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_e_learning_app_master/app/data/models/user_model.dart';
import 'package:flutter_e_learning_app_master/app/widget/snackbar_widget.dart';

class DiscussController extends GetxController {
  final fireStore = FirebaseFirestore.instance;
  String collectionName = 'chats';
  bool isLoading = true;
  UserModel userData = Get.arguments;
  final messageController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  final _selectedFile = Rx<XFile?>(null);
  XFile? get selectedFile => _selectedFile.value;

  @override
  void onInit() {
    super.onInit();
    getCollection();
    getChat();
  }

  Future<void> refreshData() async {
    await getChat();
    getCollection();
  }

  CollectionReference getCollection() {
    return fireStore.collection(collectionName);
  }

  Future<void> getChat() async {
    isLoading = true;
    update();
    try {
      await Future.delayed(const Duration(seconds: 3));
      var data = await fireStore.collection(collectionName).get();
      log(data.toString());
      isLoading = false;
      update();
    } catch (e) {
      isLoading = false;
      update();
      ErrorSnack.show(message: "Gagal memuat pesan!!!");
    }
  }

  Future<void> sendMessage(String message) async {
    try {
      await fireStore.collection(collectionName).add({
        'email': userData.data!.userEmail,
        'message': message,
        'name': userData.data!.userName,
        'send_at': Timestamp.now(),
      });
      SuccessSnack.show(message: "Pesan berhasil dikirim.");
    } catch (e) {
      ErrorSnack.show(message: "Gagal mengirim pesan. Silakan coba lagi.");
    }
  }

  Future<void> openCamera() async {
    final cameraFile = await _picker.pickImage(source: ImageSource.camera);
    _selectedFile.value = cameraFile;
  }

  Future<void> openGallery() async {
    final galleryFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    _selectedFile.value = galleryFile;
  }
}
