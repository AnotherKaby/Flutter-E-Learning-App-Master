import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_e_learning_app_master/app/data/utils/color_pallete.dart';
import '../../../routes/app_pages.dart';
import '../../../widget/grid_view_shimmer.dart';
import '../controllers/exercise_controller.dart';

class ExerciseView extends GetView<ExerciseController> {
  const ExerciseView({Key? key}) : super(key: key);

  Future<void> _onRefresh() async {
    await controller.getExercise();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: GetBuilder<ExerciseController>(
        builder: (controller) {
          return Scaffold(
            backgroundColor: ColorPallete.bgColorWhite,
            appBar: AppBar(
              backgroundColor: ColorPallete.bgColor,
              title: Text(
                controller.title,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              centerTitle: false,
            ),
            body: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 10,
                      left: 20.w,
                    ),
                    child: Text(
                      "Pilih Pake Soal",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                controller.isLoading
                    ? const Expanded(
                        child: GridViewShimmer(),
                      )
                    : controller.exerciseList.isNotEmpty
                        ? Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: GridView.builder(
                                itemCount: controller.exerciseList.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 12,
                                  mainAxisSpacing: 12,
                                  childAspectRatio: 150 / 100,
                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  return Material(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12.0.r),
                                    ),
                                    child: InkWell(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12.0.r),
                                      ),
                                      splashColor: ColorPallete.bgColor,
                                      onTap: () => Get.toNamed(
                                        Routes.question,
                                        arguments: {
                                          "exerciseId": controller
                                              .exerciseList[index].exerciseId,
                                          "email": controller.email
                                        },
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 36,
                                            width: 36,
                                            margin: EdgeInsets.only(
                                                top: 10, left: 15),
                                            decoration: const BoxDecoration(
                                              color: ColorPallete.iconBg,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(12.0),
                                              ),
                                            ),
                                            child: Center(
                                              child: Image.network(
                                                controller
                                                    .exerciseList[index].icon!,
                                                width: 20,
                                                height: 20,
                                                loadingBuilder:
                                                    (BuildContext context,
                                                        Widget child,
                                                        ImageChunkEvent?
                                                            loadingProgress) {
                                                  if (loadingProgress == null) {
                                                    return child;
                                                  }
                                                  return Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                      color:
                                                          ColorPallete.bgColor,
                                                      value: loadingProgress
                                                                  .expectedTotalBytes !=
                                                              null
                                                          ? loadingProgress
                                                                  .cumulativeBytesLoaded /
                                                              loadingProgress
                                                                  .expectedTotalBytes!
                                                          : null,
                                                    ),
                                                  );
                                                },
                                                errorBuilder: (BuildContext
                                                        context,
                                                    Object exception,
                                                    StackTrace? stackTrace) {
                                                  return Image.asset(
                                                    "assets/img/task.png",
                                                    fit: BoxFit.contain,
                                                  );
                                                },
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 8,
                                                left: 15,
                                                right: 15),
                                            child: Text(
                                              controller.exerciseList[index]
                                                  .exerciseTitle!,
                                              style: GoogleFonts.poppins(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700),
                                              maxLines: 2,
                                              overflow: TextOverflow.fade,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 2,
                                                left: 15,
                                                bottom: 10),
                                            child: Text(
                                              "${controller.exerciseList[index].jumlahDone!}/${controller.exerciseList[index].jumlahSoal} Soal",
                                              style: GoogleFonts.poppins(
                                                fontSize: 8,
                                                fontWeight: FontWeight.w500,
                                                color: ColorPallete.subTitle,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          )
                        : Expanded(
                            child: Center(
                              child: Image.asset(
                                "assets/img/notfound.png",
                                width: ScreenUtil().screenWidth,
                                height: 290.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                          )
              ],
            ),
          );
        },
      ),
    );
  }
}
