import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_e_learning_app_master/app/widget/course_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../data/utils/color_pallete.dart';
import '../../../../../routes/app_pages.dart';
import '../../../../../widget/list_view_shimmer.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  Future<void> _onRefresh() async {
    await controller.getCourseList();
    await controller.getBannerList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.bgColorWhite,
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: GetBuilder<HomeController>(
          builder: (controller) {
            return ListView(            
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  height: 50,
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Flexible(
                            child: Text(
                              "Hai, ${controller.userData.data?.userName}",
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Text(
                              "Selamat Datang",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 35,
                        width: 35,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                            controller.userData.data!.userFoto!,
                          ),
                          child: FadeInImage(
                            placeholder:
                                const AssetImage('assets/img/avatar.png'),
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
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        padding: EdgeInsets.all(20),
                        height: 147,
                        width: ScreenUtil().screenWidth,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage('assets/img/vector-ppl.png'),   
                              scale: 3,                                                   
                              alignment: AlignmentDirectional.bottomEnd),
                          color: ColorPallete.bgColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.r),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              //margin: const EdgeInsets.all(20),
                              width: 107,
                              child: Text(
                                'Mau kerjain latihan soal apa hari ini ?',
                                style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 25, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Pilih Pelajaran',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => Get.toNamed(Routes.course),
                              child: Text(
                                'Lihat Semua',
                                style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: ColorPallete.bgColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                      controller.isLoading
                          ? ListView.builder(
                            shrinkWrap: true,
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return const MyListViewShimmer();
                            },
                          )
                          : ListView.builder(
                            shrinkWrap: true,
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              if (controller.isLoading) {
                                return const MyListViewShimmer();
                              } else {
                                if (controller.courseList.isNotEmpty) {
                                  return CourseWidget(
                                    leading: controller
                                        .courseList[index].urlCover!,
                                    title: controller
                                        .courseList[index].courseName!,
                                    materi: controller
                                        .courseList[index].jumlahMateri!,
                                    done: controller
                                        .courseList[index].jumlahDone!,
                                    route: Routes.exercise,
                                    argument: {
                                      "courseId": controller
                                          .courseList[index].courseId,
                                      "email": controller
                                          .userData.data?.userEmail!,
                                      "title": controller
                                          .courseList[index].courseName,
                                    },
                                  );
                                } else {
                                  return Center(
                                    child: Text(
                                      "Saat ini tidak ada pelajaran tersedia",
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  );
                                }
                              }
                            },
                          ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: EdgeInsets.only(
                              left: 25,top:12,bottom: 11),
                          child: Text(
                            'Terbaru',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Builder(builder: (context) {
                        return CarouselSlider(
                          options: CarouselOptions(
                            height: 146,
                            autoPlay: true,
                            enlargeCenterPage: true,
                          ),
                          items: controller.bannerList.map((banner) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  height: 146,
                                  width: ScreenUtil().screenWidth,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0.r),
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0.r),
                                    ),
                                    child: GestureDetector(
                                      onTap: () async {
                                        if (banner.eventId != null) {
                                          log('Launch Url');
                                          launchUrl(
                                              Uri.parse(banner.eventUrl!));
                                        }
                                      },
                                      child: FadeInImage(
                                        placeholder: const AssetImage(
                                            'assets/img/placeholder.png'),
                                        image: NetworkImage(banner.eventImage),
                                        imageErrorBuilder:
                                            (context, error, stackTrace) {
                                          return Image.asset(
                                            'assets/img/placeholder.png',
                                            fit: BoxFit.fill,
                                          );
                                        },
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        );
                      }),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
