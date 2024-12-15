import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/icons/custom_icons.dart';
class CustomDropDown extends StatelessWidget {
  final String labelText;
  final List<String>items;
  final String hintText;
  final String selectedItem;
  final void Function(String?)? onChanged;
  final Icon prefixIcon;
  const CustomDropDown({
    super.key,required this.labelText,required this.items,required this.hintText,
    required this.selectedItem,required this.onChanged,required this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
        popupProps:
        PopupProps
            .dialog(
          showSearchBox:
          true,
          fit:
          FlexFit.loose,
          searchFieldProps:
          TextFieldProps(
            decoration:
            InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  vertical:
                  8.h,
                  horizontal:
                  10.w),
              border:
              OutlineInputBorder(),
              labelText:
              labelText,
              labelStyle: TextStyle(
                  color: AppColors
                      .greyColor,
                  fontSize:
                  16.sp,
                  fontWeight:
                  FontWeight
                      .w300,
                  fontFamily:
                  "Certa Sans"),
            ),
          ),
        ),
        items:items,
        dropdownButtonProps:
        DropdownButtonProps(
            icon: Icon(
              Icons
                  .keyboard_arrow_down_outlined,
              color: Color(
                  0xff697480),
              size: 16.sp,
            )),
        dropdownDecoratorProps:
        DropDownDecoratorProps(
          dropdownSearchDecoration:
          InputDecoration(
              labelText:
             labelText,
              hintText:hintText,
              hintStyle: TextStyle(
                  color: AppColors
                      .greyColor,
                  fontSize: 18
                      .sp,
                  fontFamily:
                  "Certa Sans"),
              labelStyle: TextStyle(
                  fontSize: 16
                      .sp,
                  fontFamily:
                  "Certa Sans"),
              contentPadding: EdgeInsets.symmetric(
                  vertical: 10
                      .h,
                  horizontal: 10
                      .w),
              prefixIcon:
              prefixIcon,
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 0.5
                          .w,
                      color: AppColors
                          .greyColor)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 0.5
                          .w,
                      color: AppColors
                          .greyColor)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 0.5.w,
                      color: AppColors.greyColor))),
        ),
        onChanged:onChanged,
        selectedItem:selectedItem,
    );
  }
}
