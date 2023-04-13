// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_e_learning_app_master/app/data/utils/color_pallete.dart';
import 'package:shimmer/shimmer.dart';

class MyListViewShimmer extends StatelessWidget {
  const MyListViewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            width: ScreenUtil().screenWidth,
            height: 96,
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(12.0.r),
              ),
            ),
          ),
        ),
        Shimmer.fromColors(
          baseColor: Colors.white,
          highlightColor: ColorPallete.bgColor,
          child: Container(
            width: ScreenUtil().screenWidth,
            height: 100,
            margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20),
                  height: 53,
                  width: 53,
                  decoration: BoxDecoration(
                    color: ColorPallete.iconBg,
                    borderRadius: BorderRadius.all(Radius.circular(12),
                    ),
                  ),
                ),
                Expanded(
                  child: 
                  Padding(
                    padding:
                        //EdgeInsets.only(top: 18, left: 18, right: 18, bottom: 18),
                        EdgeInsets.all(18),
                    child: ListView(
                      children: [
                        Container(
                          width: 77,
                          height: 18,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 141,
                          height: 18,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 13,
                        ),
                        Container(
                          //width: 218,
                          height: 5,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
