import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';

class CustomTextFormField extends StatelessWidget {
  final Icon prefixIcon;
  final String labelText;
  final String hintText;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final List<TextInputFormatter>? textInputFormatter;
  final Widget? suffixIcon;
  final BoxConstraints? suffixIconConstraints;
  final BoxConstraints? prefixIconConstraints;
  final bool obscureText;
  final int maxLines;
  final String? initialValue;
  final EdgeInsets contentPadding;
  const CustomTextFormField(
      {super.key,
      required this.prefixIcon,
      required this.labelText,
      required this.hintText,
      required this.keyboardType,
      this.controller,
      this.textInputFormatter,
      this.suffixIcon,
      this.suffixIconConstraints,
      this.prefixIconConstraints,
      required this.obscureText,
      required this.maxLines,
      this.initialValue,
        required this.contentPadding
      });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      style: TextStyle(
          fontWeight: FontWeight.w400,
          color: AppColors.mainColor,
          fontFamily: "Certa Sans",
          fontSize: 16.sp),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0.5.w, color: AppColors.greyColor)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 0.5.w)),
        border: OutlineInputBorder(
            borderSide: BorderSide(width: 0.5.w, color: AppColors.greyColor)),
        // isDense: true,
        contentPadding:contentPadding,
        suffixIconConstraints: suffixIconConstraints,
        prefixIconConstraints: prefixIconConstraints,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,

        labelText: labelText,
        labelStyle: TextStyle(fontSize: 16.sp, fontFamily: "Certa Sans"),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Color(0xffc1c1c1),
          fontSize: 16.sp,
          fontFamily: "Certa Sans",
        ),
        errorStyle: TextStyle(fontSize: 12.sp, fontFamily: "Certa Sans"),
      ),
      keyboardType: keyboardType,
      controller: controller,
      inputFormatters: textInputFormatter,
      validator: (String? value) {
        if (value!.isEmpty) return AppStrings.required.tr();
        return null;
      },
      obscureText: obscureText,
      initialValue: initialValue,
    );
  }
}
