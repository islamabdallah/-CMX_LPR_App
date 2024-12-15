import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_colors.dart';
class FormScreen extends StatefulWidget {

  const FormScreen ({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  CarouselSliderController carouselSliderController= CarouselSliderController();
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
                items: [
                  Image(image:NetworkImage("https://media.istockphoto.com/id/1293741404/vector/british-uk-car-license-plate-template-gb-car-registration-numberplate-sign-design.jpg?s=612x612&w=0&k=20&c=l8Tnl8kFenLFdWbVoyPN_PMkhtQFnXoz_xmuasC25nA=") ),
                  Image(image:NetworkImage("https://static.vecteezy.com/system/resources/thumbnails/011/306/506/small/car-number-plate-vehicle-registration-license-of-malaysia-vector.jpg") ),
                  Image(image:NetworkImage("https://media.istockphoto.com/id/1293741404/vector/british-uk-car-license-plate-template-gb-car-registration-numberplate-sign-design.jpg?s=612x612&w=0&k=20&c=l8Tnl8kFenLFdWbVoyPN_PMkhtQFnXoz_xmuasC25nA=") ),
                ],
                carouselController: carouselSliderController,
                options: CarouselOptions(
                  height: 210,
                  aspectRatio: 18 / 9,
                  viewportFraction: 0.5,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 10),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeStrategy:
                  CenterPageEnlargeStrategy.scale,
                  enlargeFactor: 0.19,
                  //  onPageChanged: callbackFunction,
                  scrollDirection: Axis.horizontal,
                )
            ),
            SizedBox(height: 10.h,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                    maxLines: 1,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: AppColors.mainColor,
                        fontFamily: "Certa Sans",
                        fontSize: 16.sp),
                    decoration: InputDecoration(
                      enabledBorder:  OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 0.5.w,
                              color: AppColors.greyColor
                          )
                      ),
                      focusedBorder:  OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 0.5.w
                          )
                      ),
                      border:  OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 0.5.w,
                              color: AppColors.greyColor
                          )
                      ),
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 20.h),
                      //suffixIconConstraints: suffixIconConstraints,
                      // prefixIconConstraints:prefixIconConstraints,
                      //  prefixIcon: prefixIcon,
                      // suffixIcon: suffixIcon,

                      labelText: "Car Number",
                      labelStyle: TextStyle(fontSize: 16.sp,fontFamily: "Certa Sans"),
                      hintText:  "Car Number",
                      hintStyle: TextStyle(color: Color(0xffc1c1c1), fontSize: 16.sp,fontFamily: "Certa Sans",),
                      errorStyle: TextStyle(fontSize: 12.sp,fontFamily: "Certa Sans"),
                    ),
                    //  controller: controller,
                    validator: (String? value) {
                      // if (value!.isEmpty) return AppStrings.required.tr();
                      // return null;
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
