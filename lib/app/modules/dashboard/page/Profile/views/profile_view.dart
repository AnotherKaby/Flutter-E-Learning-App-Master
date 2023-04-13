// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_e_learning_app_master/app/data/utils/color_pallete.dart';

import '../../../../../routes/app_pages.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: ScreenUtil().screenWidth,
            height: kToolbarHeight,
            color: ColorPallete.bgColor,
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: Get.width,
                  child: Text(
                    'Akun Saya',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.only(right: 20),
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.editProfile);
                    },
                    child: Text(
                      'Edit',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.fromLTRB(20,30,20,60),
            width: ScreenUtil().screenWidth,
            //height: 130,
            decoration: BoxDecoration(
              color: ColorPallete.bgColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        controller.userData.data!.userName!,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        controller.userData.data!.userAsalSekolah!,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        controller.userData.data!.userFoto!,
                      ),
                      child: FadeInImage(
                        placeholder: AssetImage('assets/img/avatar.png'),
                        fit: BoxFit.contain,
                        imageErrorBuilder: (BuildContext context,
                            Object exception, StackTrace? stackTrace) {
                          return Image.asset('assets/img/avatar.png');
                        },
                        image: NetworkImage(
                          controller.userData.data!.userFoto!,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: SizedBox(
              height: ScreenUtil().screenHeight * 0.7,
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  GetBuilder<ProfileController>(
                    builder: (controller) {
                      return Column(
                        children: [
                          Container(
                            width: ScreenUtil().screenWidth,
                            margin: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 20),
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  blurRadius: 7,
                                  offset: Offset(0, 0),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Identitas Diri',
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: 30.0,
                                ),
                                Text(
                                  'Nama Lengkap',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: ColorPallete.subTitle,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  controller.userData.data!.userName!,
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Text(
                                  'Email',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: ColorPallete.subTitle,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  controller.userData.data!.userEmail!,
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Text(
                                  'Jenis Kelamin',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: ColorPallete.subTitle,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  controller.userData.data!.userGender!,
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Text(
                                  'Kelas',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: ColorPallete.subTitle,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  controller.userData.data!.kelas!,
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Text(
                                  'Sekolah',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: ColorPallete.subTitle,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  controller.userData.data!.userAsalSekolah!,
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.signOut();
                            },
                            child: Container(
                              width: ScreenUtil().screenWidth,
                              height: 50,
                              margin: EdgeInsets.only(
                                  left: 16, top: 10, right: 16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.25),
                                    blurRadius: 6,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 15),
                                    child: Icon(
                                      Icons.logout,
                                      color: Colors.red,
                                    ),
                                  ),
                                  Text(
                                    "Logout",
                                    style: GoogleFonts.poppins(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
