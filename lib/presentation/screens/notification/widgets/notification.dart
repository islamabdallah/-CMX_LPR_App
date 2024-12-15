import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lpr/logic/home/home_cubit.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../data/models/notification_model/notification_model.dart';
class NotificationCard extends StatelessWidget {
  final NotificationModel notificationModel;
  const NotificationCard({super.key,required this.notificationModel});

  @override
  Widget build(BuildContext context) {
    var outputFormat = DateFormat('dd MMM, yyyy  hh:mm a',"ar");
    var requestDate = outputFormat.format(notificationModel.date??DateTime.now());
    return GestureDetector(
      onTap: ()
      {
        HomeCubit.get(context).getPendingLPRs();
        Navigator.pop(context);
      },
      child: Row(
        children: [
          ClipOval(
            child: Container(
              color: Color(0xFFf9f9f9),
              child: Image.network(
                notificationModel.imag??"",
                width: 70, // Circle diameter
                height: 70,
                fit: BoxFit
                    .scaleDown, // Ensures the image fits within the circle
              ),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(notificationModel.camera_name??"",
                style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Text(
                    "تم اضافة عربية جديدة برقم   ",
                    style: TextStyle(
                        color: AppColors.greyColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w300),
                  ),
                  Text(
                    notificationModel.ocr??"",
                    style: TextStyle(
                        color: AppColors.mainColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w800),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                requestDate??"",
                style: TextStyle(
                    color: AppColors.greyColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w300),
              ),
            ],
          )
        ],
      ),
    );
  }
}
