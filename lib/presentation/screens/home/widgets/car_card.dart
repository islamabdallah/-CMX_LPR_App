
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/icons/custom_icons.dart';
import '../../../../data/models/car_number_model/car_number_model.dart';
class CarCard extends StatelessWidget {

  final CarNumberModel carModel;
  const CarCard({super.key,required this.carModel});

  @override
  Widget build(BuildContext context) {
    var outputFormat = DateFormat('dd MMM, yyyy hh:mm a',"ar");
    var requestDate = outputFormat.format(carModel.date??DateTime.now());
    return Card(
      color: AppColors.backgroundColor,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r)
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(topLeft:Radius.circular(10.r),topRight:Radius.circular(10.r) ),
              child: Image(image: NetworkImage(carModel.imag??""),fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => Image.asset(
                    'assets/images/car_number_default.jpg',
                    fit: BoxFit.contain,
                  )
              )),
          Padding(
            padding: EdgeInsets.fromLTRB(8.w, 20.h, 8.w, 0),
            child: Column(
              children: [
                Text(carModel.camera_name??"",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.sp
                ),),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Icon(CustomIcons.calendar_day_month_date_year_icon,color: AppColors.greyColor,size: 15.r,),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(requestDate,
                      style: TextStyle(
                          color: AppColors.greyColor,
                          fontSize: 14.sp
                      ),),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(10.r)
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 4.h),
                      child: Text(AppStrings.explore.tr(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
