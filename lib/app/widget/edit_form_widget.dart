import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/utils/color_pallete.dart';

class EditFormInput extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool enabled;

  const EditFormInput({
    Key? key,
    required this.label,
    required this.controller,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 12,
            color: ColorPallete.subTitle,
            fontWeight: FontWeight.w400,
          ),
        ),
        TextFormField(
            controller: controller,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            enabled: enabled,
            decoration: InputDecoration(
              hintText: 'Masukkan $label',
              border: const UnderlineInputBorder(
                borderSide: BorderSide(color: ColorPallete.bgColorForm),
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: ColorPallete.bgColor),
              ),
              errorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
            ),
            validator: FormBuilderValidators.compose(
                [FormBuilderValidators.required()])),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
