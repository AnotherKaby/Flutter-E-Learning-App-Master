import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_e_learning_app_master/app/modules/question/controllers/question_controller.dart';

import '../../../data/utils/color_pallete.dart';

class ResultView extends GetView<QuestionController> {
  const ResultView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.bgColor,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Selamat',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            'Kamu telah menyelesaikan Kuiz ini',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 36.0,
          ),
          const Image(image: AssetImage('assets/img/done.png')),
          Text(
            'Nilai kamu :',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
          GetBuilder<QuestionController>(builder: (controller) {
            return Text(
              controller.score,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 100,
                fontWeight: FontWeight.w400,
              ),
            );
          }),
        ],
      )),
    );
  }
}
