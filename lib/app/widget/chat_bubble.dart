import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeago/timeago.dart';

class ChatBubble extends StatelessWidget {
  final String name;
  final String message;
  final Timestamp sendAt;
  final Color colorp;
  final bool? isSender;

  const ChatBubble({
    Key? key,
    required this.name,
    required this.message,
    required this.sendAt,
    required this.colorp,
    this.isSender,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isSender == true ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: GoogleFonts.poppins(
            fontSize: 10,
            fontWeight: FontWeight.w700,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 5, bottom: 3),
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(
            color: colorp,
            borderRadius: BorderRadius.circular(16.0.r),
          ),
          child: Text(
            message,
            style: GoogleFonts.poppins(
              color: isSender == true ? Colors.white : Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Text(
          format(sendAt.toDate(), locale: 'en_short'),
          style: GoogleFonts.poppins(
            fontSize: 10,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
