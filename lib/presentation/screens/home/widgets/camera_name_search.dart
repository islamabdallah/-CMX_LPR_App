
import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
class SelectCameraName extends StatelessWidget {
  final  List<String> cameras;

  const SelectCameraName({super.key,required this.cameras});

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      popupProps:PopupProps.dialog(
        showSearchBox: true,
        fit: FlexFit.loose,
        searchFieldProps: TextFieldProps(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r)
            ),
            labelText: "Select Camera",
          ),
        ),
      ),
      items: cameras,
      dropdownButtonProps: DropdownButtonProps(
        icon:Icon(Icons.keyboard_arrow_down_outlined,color:Color(0xff697480),size: 16.sp,)  ,
      ),
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
            hintStyle:  TextStyle(
              color:Colors.grey,
              fontSize: 12.sp,
              fontFamily: "Certa Sans",),
            labelStyle: TextStyle(
              color: Colors.grey,
              fontSize: 14.sp,
              fontFamily: "Certa Sans",),
            labelText: "select camera",
            hintText:"select camera",
            contentPadding: EdgeInsets.symmetric(
                vertical: 10.h, horizontal: 8.w),
            prefixIcon: Icon(Icons.photo_camera_front,color: AppColors.greyColor,size: 16.sp,),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0.r),
                borderSide: BorderSide(
                    width: 0.5.w,
                    color: Color(0xffbec0ca)
                )
            ) ,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0.r),
                borderSide: BorderSide(
                    width: 0.5.w,
                    color: Color(0xffbec0ca)
                )
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0.r),
                borderSide: BorderSide(
                    width: 0.5.w,
                    color: Color(0xffbec0ca)
                )
            )
        ),
      ),
      onChanged:(String? newValue) {

      },
      validator: (String? value) {
        if (value==null) return AppStrings.required.tr();
        return null;
      },
      //selectedItem: medicalCategories[0],
    );
  }
}