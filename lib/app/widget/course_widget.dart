// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/utils/color_pallete.dart';

class CourseWidget extends StatelessWidget {
  final String leading;
  final String title;
  final int? materi;
  final int done;
  final String? route;
  final Map<String, dynamic>? argument;

  const CourseWidget({
    super.key,
    required this.leading,
    required this.title,
    required this.materi,
    this.done = 0,
    this.route,
    this.argument,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().screenWidth,
      height: 96,
      margin: EdgeInsets.fromLTRB(20,0,20,10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Material(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        child: InkWell(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          onTap: () =>
              route != null ? Get.toNamed(route!, arguments: argument) : '',
          splashColor: ColorPallete.bgColor,
          hoverColor: Colors.white,
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
                child: Center(
                  child: Image.network(
                    leading,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          color: ColorPallete.bgColor,
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return Image.asset(
                        "assets/img/atom.png",
                        fit: BoxFit.contain,
                      );
                    },
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Expanded(
                  child: Padding(
                padding: 
                EdgeInsets.only(left: 9, right: 18),
                //EdgeInsets.all(0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    //SizedBox(height: 10,),
                    Text(
                      "$done/$materi Paket latihan soal",
                      style: GoogleFonts.poppins(
                          fontSize: 12,                        
                          fontWeight: FontWeight.w500,
                          color: ColorPallete.subTitle),
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    LinearProgressIndicator(
                      value: materi != null ? 0 : done / materi!,
                      minHeight: 5,
                      backgroundColor: Colors.grey[300],
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(Colors.blue),
                    )
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
