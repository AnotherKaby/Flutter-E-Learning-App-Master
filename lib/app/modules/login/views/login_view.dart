import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_e_learning_app_master/app/data/utils/color_pallete.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.bgColorWhite,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 32, top: 32),
                child: Text(
                  "Login",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Image.asset(
                  "assets/img/analys.png",
                  width: ScreenUtil().screenWidth,
                  fit: BoxFit.contain,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 56),
                child: Text(
                  'Selamat Datang',
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30,right: 30),
                child: Text(
                  'Selamat Datang di Aplikasi Widya Edu\nAplikasi Latihan dan Konsultasi Soal',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: Color(0xFF6A7483),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const Expanded(child: SizedBox.shrink()),
          GetBuilder<LoginController>(
            builder: (controller) {
              return controller.isLoading
                  ? SizedBox(height: 50, width: 50, child: const Center(child: CircularProgressIndicator(),),)
                  : Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        child: Column(
                          children: [
                            Container(
                              height: 50,
                              width: 269,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    width: 1, color: ColorPallete.strokeGreen),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(25.0),
                                ),
                              ),
                              child: Material(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(25.0),
                                ),
                                child: InkWell(
                                  splashColor: ColorPallete.bgColor,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(25.0),
                                  ),
                                  onTap: () async {
                                    await controller.onGoogleSignIn();
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/icon/google.png",
                                        width: 26,
                                        height: 26,
                                        fit: BoxFit.contain,
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Text(
                                        "Masuk dengan Google",
                                        style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 269,
                              margin: EdgeInsets.only(top: 25,bottom: 25),
                              decoration: BoxDecoration(                                                             
                                borderRadius: const BorderRadius.all(Radius.circular(25.0),
                                ),
                              ),
                              child: Material(
                                color: Colors.black,
                                borderRadius: const BorderRadius.all(Radius.circular(25.0),
                                ),
                                child: InkWell(
                                  splashColor: ColorPallete.bgColor,
                                  borderRadius: const BorderRadius.all(Radius.circular(25.0),
                                  ),
                                  onTap: () async {
                                    await controller.onGoogleSignIn();
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/icon/apple.png",
                                        width: 26,
                                        height: 26,
                                        fit: BoxFit.contain,
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Text(
                                        "Masuk dengan Apple ID",
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }
}
