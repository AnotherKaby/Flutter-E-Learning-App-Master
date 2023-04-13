import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_e_learning_app_master/app/data/utils/color_pallete.dart';
import 'package:flutter_e_learning_app_master/app/widget/form_input_widget.dart';
import 'package:flutter_e_learning_app_master/app/widget/snackbar_widget.dart';

import '../controllers/registration_controller.dart';

class registrationView extends GetView<registrationController> {
  const registrationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.bgColorWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          color: Colors.black,
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          'Yuk isi data diri',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 30,
            width: ScreenUtil().screenWidth,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12.0.r),
                bottomRight: Radius.circular(12.0.r),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
          ),
          Expanded(
            child: GetBuilder<registrationController>(
              builder: (controller) => Form(
                key: controller.formKey,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding:
                      EdgeInsets.symmetric(vertical: 25, horizontal: 25),
                  children: [
                    FormInput(
                      label: 'Email',
                      controller: controller.emailTextController,
                      enabled: false,
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    FormInput(
                      label: 'Nama Lengkap',
                      controller: controller.nameTextController,
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Text(
                      'Jenis Kelamin',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              controller.jenisKelamin = 'Laki-Laki';
                              controller.update();
                            },
                            child: Container(
                              height: 60,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.r),
                                border: Border.all(
                                  color: controller.jenisKelamin == 'Laki-Laki'
                                      ? Colors.green
                                      : ColorPallete.bgColorForm,
                                  width: controller.jenisKelamin == 'Laki-Laki'
                                      ? 3
                                      : 1,
                                ),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 6),
                              child: Text(
                                'Laki-Laki',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              controller.jenisKelamin = 'Perempuan';
                              controller.update();
                            },
                            child: Container(
                              height: 60,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.r),
                                border: Border.all(
                                  color: controller.jenisKelamin == 'Perempuan'
                                      ? Colors.green
                                      : ColorPallete.bgColorForm,
                                  width: controller.jenisKelamin == 'Perempuan'
                                      ? 3
                                      : 1,
                                ),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 6),
                              child: Text(
                                'Perempuan',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Text(
                      'Kelas',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    DropdownButtonFormField(
                      value: controller.kelas,
                      items: controller.kelasList
                          .map(
                            (kelas) => DropdownMenuItem<String>(
                          value: kelas,
                          child: Text(
                            kelas,
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      )
                          .toList(),
                      onChanged: (value) {
                        controller.kelas = value;
                        controller.update();
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: const BorderSide(
                            color: ColorPallete.bgColorForm,
                            width: 3,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: const BorderSide(
                            color: ColorPallete.bgColorForm,
                            width: 1,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: const BorderSide(
                            color: Colors.red,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: const BorderSide(
                            color: ColorPallete.bgColorForm,
                            width: 1,
                          ),
                        ),
                        hintText: 'Pilih Kelas',
                      ),
                      validator: FormBuilderValidators.compose(
                          [FormBuilderValidators.required()]),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    FormInput(
                        label: 'Nama Sekolah',
                        controller: controller.schoolNameTextController),

                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
                      width: Get.width,
                      height: 65,
                      child: ElevatedButton(
                        onPressed: () async {
                          controller.formKey.currentState!.validate()
                              ? controller.jenisKelamin != null
                              ? await controller.registerUser()
                              : ErrorSnack.show(
                              message: 'Jenis kelamin tidak boleh kosong')
                              : ErrorSnack.show(message: 'Lengkapi form terlebih dahulu');
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(45),
                          ),
                          backgroundColor: ColorPallete.bgColor,
                          splashFactory: InkRipple.splashFactory,
                        ),
                        child: Text(
                          'Daftar',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
