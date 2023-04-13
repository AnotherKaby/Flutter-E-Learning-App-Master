import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../data/utils/color_pallete.dart';

Shimmer chatShimmer() {
  return Shimmer.fromColors(
    baseColor: Colors.white,
    highlightColor: ColorPallete.bgColor,
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  color: Colors.white,
                  height: 20,
                  margin: EdgeInsets.only(left: 50, right: 10),
                ),
              ),
              SizedBox(height: 50, width: 50, child: const CircleAvatar()),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 50, width: 50, child: const CircleAvatar()),
              Expanded(
                child: Container(
                  color: Colors.white,
                  height: 20,
                  margin: EdgeInsets.only(left: 10, right: 50),
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
