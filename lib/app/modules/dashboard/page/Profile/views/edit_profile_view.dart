import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_e_learning_app_master/app/modules/dashboard/page/Profile/controllers/profile_controller.dart';

import '../../../../../data/utils/color_pallete.dart';
import '../../../../../widget/edit_form_widget.dart';

class EditProfileView extends GetView<ProfileController> {
  const EditProfileView({Key? key}) : super(key: key);
  static const List<String> list = <String>['Laki-Laki', 'Perempuan'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.bgColorWhite,
      appBar: AppBar(
        backgroundColor: ColorPallete.bgColor,
        title: Text(
          'Edit Akun',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Container(
              width: ScreenUtil().screenWidth,
              height: ScreenUtil().screenHeight,
              margin: EdgeInsets.only(left: 20, right: 20),
              child: GetBuilder<ProfileController>(
                builder: (controller) {
                  return Form(
                    key: controller.formKey,
                    child: ListView(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 25.0,
                            ),
                            Text(
                              'Data Diri',
                              style: GoogleFonts.poppins(
                                  fontSize: 20, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 16.0,
                            ),

                            TextField(
                              controller: controller.etName,
                              decoration: InputDecoration(
                                labelText: 'Nama Lengkap',
                              ),
                            ),
                            const SizedBox(height: 20.0,),
                            TextField(
                              controller: controller.etEmail,
                              decoration: InputDecoration(
                                labelText: 'Email',
                              ),
                            ),
                            const SizedBox(height: 20.0,),
                            TextField(
                              readOnly: true,
                              controller: controller.etGender,
                              decoration: InputDecoration(
                                suffixIcon: const Icon(Icons.arrow_drop_down),
                                labelText: 'Jenis Kelamin',
                                hintText: 'Pilih Jenis Kelamin',
                              ),
                              onTap: () => Get.bottomSheet(chooseGender(context)),
                            ),
                            const SizedBox(height: 20.0,),
                            TextField(
                              readOnly: true,
                              controller: controller.etKelas,
                              decoration: InputDecoration(
                                suffixIcon: const Icon(Icons.arrow_drop_down),
                                labelText: 'Kelas',
                                hintText: 'Pilih Kelas',
                              ),
                              onTap: () => Get.bottomSheet(chooseKelas(context)),
                            ),
                            const SizedBox(height: 20.0,),
                            TextField(

                              controller: controller.etSekolah,
                              decoration: InputDecoration(
                                labelText: 'Sekolah',
                              ),
                            ),
                            /////////////BUTTON//////////////////////
                            SizedBox(
                              height: 30.0,
                            ),
                            Container(
                              height: 40,
                              width: ScreenUtil().screenWidth,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: ColorPallete.bgColor,
                                ),
                                onPressed: () async {
                                  await controller.updateUser();
                                },
                                child: Text(
                                  "Perbarui Data",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget chooseGender(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: const Text('Laki - laki'),
            onTap: () => controller.onSelectedGender(
              value: true,
              onSelected: () => Get.back(),
            ),
          ),
          const Divider(color: Colors.grey),
          ListTile(
            title: const Text('Perempuan'),
            onTap: () => controller.onSelectedGender(
              value: false,
              onSelected: () => Get.back(),
            ),
          ),
        ],
      ),
    );
  }
  Widget chooseKelas(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: const Text('10'),
            onTap: () => controller.onSelectedKelas(
              value: '10',
              onSelected: () => Get.back(),
            ),
          ),
          const Divider(color: Colors.grey),
          ListTile(
            title: const Text('11'),
            onTap: () => controller.onSelectedKelas(
              value: '11',
              onSelected: () => Get.back(),
            ),
          ),
          const Divider(color: Colors.grey),
          ListTile(
            title: const Text('12'),
            onTap: () => controller.onSelectedKelas(
              value: '12',
              onSelected: () => Get.back(),
            ),
          ),
        ],
      ),
    );
  }
}
