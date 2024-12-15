import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';

showMessageDialog({
  required BuildContext context,
  String? message,
  required bool isSucceeded,
  VoidCallback? onPressedOk,
}) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0.r)),
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          top:  BorderSide(
                            color: isSucceeded?Colors.green:AppColors.redColor,
                            width: 15.w,
                          )
                      )
                  ),
                  height: 200.h,
                  width: 372.w,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10.w, 30.h, 10.w, 20.h),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            // width: 200.w,
                            child: FittedBox(
                              child: Text(
                                isSucceeded ? AppStrings.success.tr() : AppStrings.error.tr(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30.sp,
                                  fontFamily: "Certa Sans",
                                  color:
                                  isSucceeded ? Colors.green : Colors.red,
                                ),
                                maxLines: 3,
                              ),
                            ),
                          ),
                          Divider(
                            endIndent: 120.w,
                            indent: 120.w,
                            color: AppColors.greyColor,
                            thickness: 2,
                          ),
                          Text(
                            message??'',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16.sp, fontFamily: "Certa Sans",),
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            maxLines: 3,
                          ),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 100.w,
                                height: 50.h,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    onPressedOk?.call();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: isSucceeded
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                                  child: Text(
                                    AppStrings.ok.tr(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16.sp),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ]),
                  ),
                ),
                Positioned(
                    top: -50.h,
                    child: isSucceeded
                        ? CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: 50.r,
                      child: Icon(
                        Icons.verified_user,
                        color: Colors.white,
                        size: 50.h,
                      ),
                    )
                        : CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 50.r,
                      child: Icon(
                        Icons.privacy_tip,
                        color: Colors.white,
                        size: 50.h,
                      ),
                    )),
              ],
            )),
      );
    },
  );
}
