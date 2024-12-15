import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomLPRLogo extends StatelessWidget {
  const CustomLPRLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Center(
        child: Hero(
          tag: 'logo',
          child: Image.asset(
            'assets/images/logo.png',
            height: 200.h,
            width: 200.w,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
