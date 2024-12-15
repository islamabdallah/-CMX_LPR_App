import 'dart:io';
import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lpr/presentation/screens/home/widgets/car_card.dart';
import 'package:lpr/presentation/screens/home/widgets/select_feedback.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/icons/custom_icons.dart';
import '../../../logic/home/home_cubit.dart';
import '../../../logic/home/home_state.dart';
import '../../utils/helpers.dart';
import '../../utils/loading_dialog.dart';
import '../../utils/message_dialog.dart';
import '../login/widgets/custom_text_field.dart';
import '../notification/notification_screen.dart';
import 'package:badges/badges.dart' as bg;
import 'package:auto_size_text/auto_size_text.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = 'HomeScreen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CarouselSliderController carouselSliderController =
      CarouselSliderController();
  bool loadingSkeletonizer = true;
  late GlobalKey<FormState> _filterKey;

  @override
  void initState() {
    super.initState();
    _filterKey = GlobalKey<FormState>();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      HomeCubit.get(context).getPendingLPRs();
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 20) / 3;
    final double itemWidth = size.width / 2;
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is GetPendingLPRsLoadingState) {
          loadingAlertDialog(context);
        }
        if (state is GetPendingLPRsSuccessState) {
          Navigator.pop(context);
          loadingSkeletonizer = false;
        }
        if (state is GetPendingLPRsErrorState) {
          Navigator.pop(context);
          showMessageDialog(
            context: context,
            isSucceeded: false,
            message: state.message,
          );
        }

        if (state is ConfirmLPRLoadingState) {
          loadingAlertDialog(context);
        }
        if (state is ConfirmLPRSuccessState) {
          Navigator.pop(context);
          showMessageDialog(
              context: context,
              isSucceeded: true,
              message: "تم تسجيل السيارة بنجاح",
              onPressedOk: () {
                HomeCubit.get(context).clearLPrData();
                HomeCubit.get(context).getPendingLPRs();
              });
        }


        if (state is AddLPRLoadingState) {
          loadingAlertDialog(context);
        }
        if (state is AddLPRSuccessState) {
          Navigator.pop(context);
          showMessageDialog(
              context: context,
              isSucceeded: true,
              message: "تم تسجيل السيارة بنجاح",
              onPressedOk: () {
                HomeCubit.get(context).clearLPrData();
                HomeCubit.get(context).getPendingLPRs();
              });
        }
        if (state is AddLPRErrorState) {
          Navigator.pop(context);
          showMessageDialog(
              context: context,
              isSucceeded: false,
              message: state.message,
              // onPressedOk: () {
              //   HomeCubit.get(context).clearLPrData();
              //   HomeCubit.get(context).getPendingLPRs();
              // }
              );
        }
      },
      builder: (context, state) {
        var _cubit = HomeCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text(
              AppStrings.carsLog.tr(),
              style: TextStyle(
                  color: AppColors.mainColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600),
            ),
            centerTitle: true,
            leading: BlocBuilder<HomeCubit, HomeStates>(
              builder: (context, state) {
                return bg.Badge(
                  showBadge: _cubit.notificationCount != 0,
                  ignorePointer: true,
                  position: BadgePosition.bottomEnd(bottom: 0, end: 0),
                  badgeContent: Container(
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    width: 18.w,
                    height: 18.h,
                    child: AutoSizeText(
                      _cubit.notificationCount > 99
                          ? '+99'
                          : _cubit.notificationCount.toString(),
                      maxLines: 1,
                      wrapWords: false,
                      textAlign: TextAlign.center,
                      minFontSize: 9,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  child: Padding(
                    padding: context.locale == Locale("ar")
                        ? EdgeInsets.only(right: 10.w)
                        : EdgeInsets.only(left: 10.w),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, NotificationScreen.routeName);
                      },
                      icon: Icon(CustomIcons.bell),
                      color: AppColors.mainColor,
                      iconSize: 25.sp,
                    ),
                  ),
                );
              },
            ),
            actions: [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                        logOut(context);
                      },
                      icon: Icon(
                        Icons.logout,
                        color: AppColors.mainColor,
                        size: 24.sp,
                      )))
            ],
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                          child: TextField(
                            onChanged: (String? newValue)
                            {
                              _cubit.searchInPendingLPRs();
                            },
                            style: TextStyle(
                                fontSize: 12.sp, fontFamily: "Certa Sans"),
                            controller: _cubit.searchByCarNumberController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: AppStrings.searchByCarNumber.tr(),
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 8.h, horizontal: 11.w),
                              fillColor: Colors.white,
                              filled: true,
                              labelStyle: TextStyle(
                                  fontSize: 16.sp, fontFamily: "Certa Sans"),
                              hintStyle: TextStyle(
                                  color: Color(0xFFB5B9B9),
                                  fontSize: 16.sp,
                                  fontFamily: "Certa Sans",
                                  fontWeight: FontWeight.w500),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  Icons.clear,
                                  size: 17.r,
                                ),
                                onPressed: () {
                                  _cubit.clearSearch();
                                },
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.whiteGreyColor,
                                    width: 0.5.w),
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.whiteGreyColor,
                                    width: 0.5.w),
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(15.r),
                        onTap: () {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25.r),
                                  topRight: Radius.circular(25.r),
                                ),
                              ),
                              context: context,
                              builder: (BuildContext context) {
                                return BlocBuilder(
                                    bloc: _cubit,
                                    builder: (context, state) {
                                      return SizedBox(
                                        height: 300.h,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 16.w, vertical: 16.h),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    "اختر الكاميرا",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 20.sp),
                                                  ),
                                                  Spacer(),
                                                  TextButton(
                                                    onPressed: () {
                                                      _cubit.clearFilter();
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text(
                                                      "مسح الكل",
                                                      style: TextStyle(
                                                          color: Colors.red,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 20.sp),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              Divider(
                                                indent: 0,
                                                endIndent: 0,
                                                thickness: 0.4.w,
                                                color: AppColors.greyColor,
                                              ),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              SizedBox(
                                                height: 150.h,
                                                child: Scrollbar(
                                                  thumbVisibility: true,
                                                  child: ListView.builder(
                                                      shrinkWrap: true,
                                                      physics: ScrollPhysics(),
                                                      itemCount: _cubit
                                                          .camerasName.length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return Row(
                                                          children: [
                                                            Text(
                                                              _cubit.camerasName[
                                                                  index],
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      18.sp,
                                                                  fontFamily:
                                                                      "Certa Sans"),
                                                            ),
                                                            Spacer(),
                                                            Radio<bool>(
                                                              value: true,
                                                              toggleable: true,
                                                              activeColor:
                                                                  AppColors
                                                                      .mainColor,
                                                              groupValue: _cubit
                                                                      .radioValues[
                                                                  index],
                                                              onChanged:
                                                                  (value) {
                                                                _cubit.updateRadioValues(
                                                                    index,
                                                                    value ??
                                                                        false);
                                                                _cubit.updateFilterCamerasName(
                                                                    _cubit.camerasName[
                                                                        index],
                                                                    index);
                                                              },
                                                            )
                                                          ],
                                                        );
                                                      }),
                                                ),
                                              ),
                                              Spacer(),
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                  _cubit.filterLPRs();
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color:
                                                          AppColors.mainColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.r)),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 30.w,
                                                            vertical: 10.h),
                                                    child: Text(
                                                        AppStrings.filtration
                                                            .tr(),
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 16.sp)),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              });
                        },
                        child: Ink(
                          width: 38.w,
                          height: 40.w,
                          decoration: BoxDecoration(
                            color: AppColors.mainColor,
                            boxShadow: [
                              BoxShadow(color: Colors.black26, blurRadius: 10)
                            ],
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          child: Center(
                              child: Icon(
                            // Icons.filter_list_alt,
                            Icons.filter_alt_sharp,
                            size: 17.r,
                            // color: Color(0xFF2c93e7),
                            color: Colors.white,
                          )),
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(15.r),
                        onTap: ()
                           {
                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.r)),
                                  scrollable: true,
                                  title: Text(
                                    "اضافة رقم اللوحة",
                                  ),
                                  content: BlocBuilder<HomeCubit, HomeStates>(
                                    builder: (BuildContext context, state) {
                                      return Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              _cubit.pickImage();
                                            },
                                            child: _cubit.selectedImage.isNotEmpty
                                                ? Stack(
                                              alignment: Alignment.topRight,
                                              children: [
                                                Image.file(
                                                    File(_cubit.image!.path),
                                                    height: 100.h,
                                                    width: 100.w,
                                                    fit: BoxFit.cover),
                                                Positioned(
                                                  right: 5,
                                                  top: 5,
                                                  child: Container(
                                                    width: 25,
                                                    height: 25,
                                                    child: IconButton(
                                                      iconSize: 20,
                                                      padding: EdgeInsets.zero,
                                                      icon: Icon(
                                                        Icons.remove_circle,
                                                        size: 20,
                                                        color: Colors.red,
                                                      ),
                                                      onPressed: () {
                                                        _cubit.removeImage();
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                                : DottedBorder(
                                                color: AppColors.greyColor,
                                                strokeWidth: 0.7,
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 5.h,
                                                      horizontal: 15.w),
                                                  child: Column(
                                                    children: [
                                                      Image.asset(
                                                        "assets/images/upload_image_icon.png",
                                                        height: 30.h,
                                                        width: 30.w,
                                                      ),
                                                      SizedBox(
                                                        height: 10.h,
                                                      ),
                                                      Text(
                                                        AppStrings.upload.tr(),
                                                        style: TextStyle(
                                                            color: AppColors
                                                                .greyColor,
                                                            fontWeight:
                                                            FontWeight.w600,
                                                            fontSize: 16.sp,
                                                            fontFamily:
                                                            "Certa Sans"),
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                          ),
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          CustomDropDown(
                                            prefixIcon: Icon(
                                              Icons.control_camera,
                                              color: AppColors.greyColor,
                                              size: 16.sp,
                                            ),
                                            labelText: "حدد الكاميرا",
                                            items: _cubit.camerasName,
                                            hintText: "حدد الكاميرا",
                                            selectedItem: _cubit.selectedCameraName,
                                            onChanged: (String? newValue) {
                                              _cubit.selectCameraName(newValue);
                                            },
                                          ),
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          CustomTextFormField(
                                            contentPadding: EdgeInsets.symmetric(
                                                vertical: 12.h, horizontal: 10.w),
                                            maxLines: 1,
                                            prefixIcon: Icon(
                                              CustomIcons.user_info,
                                              size: 20.r,
                                            ),
                                            labelText: "رقم السيارة",
                                            hintText: "45629438",
                                            keyboardType: TextInputType.text,
                                            controller: _cubit.inputOCR,
                                            suffixIconConstraints: BoxConstraints(
                                                maxHeight: 20.h, minWidth: 50.w),
                                            prefixIconConstraints: BoxConstraints(
                                                minHeight: 20.h, minWidth: 40.w),
                                            // textInputFormatter: [
                                            // FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                                            // ],
                                            obscureText: false,
                                          ),
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);
                                              _cubit.addLPR();
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: AppColors.mainColor,
                                                  borderRadius:
                                                  BorderRadius.circular(10.r)),
                                              width: 100.w,
                                              height: 40.h,
                                              child: Center(
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 16.w,
                                                      vertical: 4.h),
                                                  child: Text(AppStrings.submit.tr(),
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20.sp)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                );
                              },
                            );
                        },
                        child: Ink(
                          width: 58.w,
                          height: 40.w,
                          decoration: BoxDecoration(
                            color: Color(0xFF08a033),
                            boxShadow: [
                              BoxShadow(color: Colors.black26, blurRadius: 10)
                            ],
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          child: Center(
                              child: Text("اضافة",style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp
                              ),)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),

                  Text(
                    state is SearchInPendingLPRsSuccessState
                        ? "الحالي : ${HomeCubit.get(context).searchPendingLPRsCarsResult.length}"
                        : state is FilterLPRsSuccessState
                            ? "الحالي : ${HomeCubit.get(context).filteredPendingLPRsCars.length}"
                            : "الحالي : ${HomeCubit.get(context).pendingLPRsCars.length}",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Wrap(
                    children: List<Widget>.generate(
                      _cubit.filterCamerasName.length,
                      (int idx) {
                        return Padding(
                          padding: EdgeInsets.only(right: 5.w),
                          child: Chip(
                            label: Text(_cubit.filterCamerasName[idx]),
                            shape: StadiumBorder(
                                side: BorderSide(
                                    color: Colors.black, width: 0.2.w)),
                            labelStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp),
                            deleteIcon: Icon(
                              Icons.cancel,
                              color: AppColors.redColor,
                              size: 16.sp,
                            ),
                            onDeleted: () {
                              setState(() {
                                if (_cubit.filterCamerasName.length == 1) {
                                  _cubit.clearFilter();
                                } else {
                                  _cubit.removeActivationFromItemInFilter(
                                      _cubit.filterCamerasName[idx]);
                                  _cubit.filterCamerasName
                                      .remove(_cubit.filterCamerasName[idx]);
                                  _cubit.filterLPRs();
                                }
                              });
                            },
                          ),
                        );
                      },
                    ).toList(),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Expanded(
                    flex: 1,
                    child: Scrollbar(
                      thumbVisibility: true,
                      thickness: 8.w,
                      radius: Radius.circular(10.r),
                      child: Skeletonizer(
                        enabled: loadingSkeletonizer,
                        child: state is SearchInPendingLPRsSuccessState
                            ? GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, //
                                  childAspectRatio: (itemWidth / itemHeight),
                                  crossAxisSpacing:
                                      5.0, // Space between columns
                                  mainAxisSpacing: 10.0, // Space between rows
                                ),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      _cubit.setInitialValueToOcrController(
                                          _cubit
                                                  .searchPendingLPRsCarsResult[
                                                      index]
                                                  .ocr ??
                                              "");
                                      showDialog(
                                          barrierDismissible: false,
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.r)),
                                              scrollable: true,
                                              title: Text(
                                                "تأكيد صحة رقم اللوحة",
                                              ),
                                              content: Column(
                                                children: [
                                                  Image(
                                                      image: NetworkImage(_cubit
                                                              .searchPendingLPRsCarsResult[
                                                                  index]
                                                              .imag ??
                                                          ""),
                                                      fit: BoxFit.contain,
                                                      errorBuilder: (context,
                                                              error,
                                                              stackTrace) =>
                                                          Image.asset(
                                                            'assets/images/car_number_default.jpg',
                                                            fit: BoxFit.contain,
                                                          )),
                                                  SizedBox(
                                                    height: 20.h,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .camera_alt_outlined,
                                                        color: Colors.black,
                                                      ),
                                                      SizedBox(
                                                        width: 10.w,
                                                      ),
                                                      Text(
                                                        _cubit
                                                                .searchPendingLPRsCarsResult[
                                                                    index]
                                                                .camera_name ??
                                                            "",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 16.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 20.h,
                                                  ),
                                                  CustomTextFormField(
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 20.h,
                                                            horizontal: 10.w),
                                                    maxLines: 1,
                                                    prefixIcon: Icon(
                                                      CustomIcons.car,
                                                      size: 20.r,
                                                    ),
                                                    labelText: "رقم السيارة",
                                                    hintText: "Enter password",
                                                    keyboardType: TextInputType
                                                        .visiblePassword,
                                                    suffixIconConstraints:
                                                        BoxConstraints(
                                                            maxHeight: 20.h,
                                                            minWidth: 50.w),
                                                    prefixIconConstraints:
                                                        BoxConstraints(
                                                            minHeight: 20.h,
                                                            minWidth: 40.w),
                                                    obscureText: false,
                                                    controller: _cubit.ocr,
                                                  ),
                                                  SizedBox(
                                                    height: 30.h,
                                                  ),
                                                  CustomDropDown(
                                                    prefixIcon: Icon(
                                                      CustomIcons.document,
                                                      color:
                                                          AppColors.greyColor,
                                                      size: 16.sp,
                                                    ),
                                                    labelText: "حدد التقييم",
                                                    items: _cubit.feedBacks,
                                                    hintText: "حدد التقييم",
                                                    selectedItem:
                                                        _cubit.selectedFeedBack,
                                                    onChanged:
                                                        (String? newValue) {
                                                      _cubit.selectFeedBack(
                                                          newValue);
                                                    },
                                                  ),
                                                  SizedBox(
                                                    height: 30.h,
                                                  ),
                                                  GestureDetector(
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          color:
                                                              Color(0xFF0cad39),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.r)),
                                                      child: Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    30.w,
                                                                vertical: 10.h),
                                                        child: Text(
                                                            AppStrings.approve
                                                                .tr(),
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize:
                                                                    18.sp)),
                                                      ),
                                                    ),
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                      _cubit.confirmLPR(_cubit
                                                              .searchPendingLPRsCarsResult[
                                                                  index]
                                                              .carId ??
                                                          0);
                                                    },
                                                  )
                                                ],
                                              ),
                                            );
                                          });
                                    },
                                    child: CarCard(
                                      carModel: HomeCubit.get(context)
                                          .searchPendingLPRsCarsResult[index],
                                    ),
                                  );
                                },
                                itemCount: HomeCubit.get(context)
                                    .searchPendingLPRsCarsResult
                                    .length, // Number of items
                              )
                            : state is FilterLPRsSuccessState
                                ? GridView.builder(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2, //
                                      childAspectRatio:
                                          (itemWidth / itemHeight),
                                      crossAxisSpacing:
                                          5.0, // Space between columns
                                      mainAxisSpacing:
                                          10.0, // Space between rows
                                    ),
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          _cubit.setInitialValueToOcrController(
                                              _cubit
                                                      .filteredPendingLPRsCars[
                                                          index]
                                                      .ocr ??
                                                  "");
                                          showDialog(
                                              barrierDismissible: false,
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.r)),
                                                  scrollable: true,
                                                  title: Text(
                                                    "تأكيد صحة رقم اللوحة",
                                                  ),
                                                  content: Column(
                                                    children: [
                                                      Image(
                                                          image: NetworkImage(_cubit
                                                                  .filteredPendingLPRsCars[
                                                                      index]
                                                                  .imag ??
                                                              ""),
                                                          fit: BoxFit.contain,
                                                          errorBuilder: (context,
                                                                  error,
                                                                  stackTrace) =>
                                                              Image.asset(
                                                                'assets/images/car_number_default.jpg',
                                                                fit: BoxFit
                                                                    .contain,
                                                              )),
                                                      SizedBox(
                                                        height: 20.h,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .camera_alt_outlined,
                                                            color: Colors.black,
                                                          ),
                                                          SizedBox(
                                                            width: 10.w,
                                                          ),
                                                          Text(
                                                            _cubit
                                                                    .filteredPendingLPRsCars[
                                                                        index]
                                                                    .camera_name ??
                                                                "",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 16.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 20.h,
                                                      ),
                                                      CustomTextFormField(
                                                        contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        20.h,
                                                                    horizontal:
                                                                        10.w),
                                                        maxLines: 1,
                                                        prefixIcon: Icon(
                                                          CustomIcons.car,
                                                          size: 20.r,
                                                        ),
                                                        labelText:
                                                            "رقم السيارة",
                                                        hintText:
                                                            "Enter password",
                                                        keyboardType:
                                                            TextInputType
                                                                .visiblePassword,
                                                        suffixIconConstraints:
                                                            BoxConstraints(
                                                                maxHeight: 20.h,
                                                                minWidth: 50.w),
                                                        prefixIconConstraints:
                                                            BoxConstraints(
                                                                minHeight: 20.h,
                                                                minWidth: 40.w),
                                                        obscureText: false,
                                                        controller: _cubit.ocr,
                                                      ),
                                                      SizedBox(
                                                        height: 30.h,
                                                      ),
                                                      CustomDropDown(
                                                        prefixIcon: Icon(
                                                          CustomIcons.document,
                                                          color: AppColors
                                                              .greyColor,
                                                          size: 16.sp,
                                                        ),
                                                        labelText:
                                                            "حدد التقييم",
                                                        items: _cubit.feedBacks,
                                                        hintText: "حدد التقييم",
                                                        selectedItem: _cubit
                                                            .selectedFeedBack,
                                                        onChanged:
                                                            (String? newValue) {
                                                          _cubit.selectFeedBack(
                                                              newValue);
                                                        },
                                                      ),
                                                      SizedBox(
                                                        height: 30.h,
                                                      ),
                                                      GestureDetector(
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              color: Color(
                                                                  0xFF0cad39),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.r)),
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        30.w,
                                                                    vertical:
                                                                        10.h),
                                                            child: Text(
                                                                AppStrings
                                                                    .approve
                                                                    .tr(),
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        18.sp)),
                                                          ),
                                                        ),
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                          _cubit.confirmLPR(_cubit
                                                                  .filteredPendingLPRsCars[
                                                                      index]
                                                                  .carId ??
                                                              0);
                                                        },
                                                      )
                                                    ],
                                                  ),
                                                );
                                              });
                                        },
                                        child: CarCard(
                                          carModel: HomeCubit.get(context)
                                              .filteredPendingLPRsCars[index],
                                        ),
                                      );
                                    },
                                    itemCount: HomeCubit.get(context)
                                        .filteredPendingLPRsCars
                                        .length, // Number of items
                                  )
                                : GridView.builder(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2, //
                                      childAspectRatio:
                                          (itemWidth / itemHeight),
                                      crossAxisSpacing:
                                          5.0, // Space between columns
                                      mainAxisSpacing:
                                          10.0, // Space between rows
                                    ),
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          _cubit.setInitialValueToOcrController(
                                              _cubit.pendingLPRsCars[index]
                                                      .ocr ??
                                                  "");
                                          showDialog(
                                              barrierDismissible: false,
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.r)),
                                                  scrollable: true,
                                                  title: Text(
                                                    "تأكيد صحة رقم اللوحة",
                                                  ),
                                                  content: Column(
                                                    children: [
                                                      Image(
                                                          image: NetworkImage(_cubit
                                                                  .pendingLPRsCars[
                                                                      index]
                                                                  .imag ??
                                                              ""),
                                                          fit: BoxFit.contain,
                                                          errorBuilder: (context,
                                                                  error,
                                                                  stackTrace) =>
                                                              Image.asset(
                                                                'assets/images/car_number_default.jpg',
                                                                fit: BoxFit
                                                                    .contain,
                                                              )),
                                                      SizedBox(
                                                        height: 20.h,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .camera_alt_outlined,
                                                            color: Colors.black,
                                                          ),
                                                          SizedBox(
                                                            width: 10.w,
                                                          ),
                                                          Text(
                                                            _cubit
                                                                    .pendingLPRsCars[
                                                                        index]
                                                                    .camera_name ??
                                                                "",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 16.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 20.h,
                                                      ),
                                                      CustomTextFormField(
                                                        contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        20.h,
                                                                    horizontal:
                                                                        10.w),
                                                        maxLines: 1,
                                                        prefixIcon: Icon(
                                                          CustomIcons.car,
                                                          size: 20.r,
                                                        ),
                                                        labelText:
                                                            "رقم السيارة",
                                                        hintText:
                                                            "Enter password",
                                                        keyboardType:
                                                            TextInputType
                                                                .visiblePassword,
                                                        suffixIconConstraints:
                                                            BoxConstraints(
                                                                maxHeight: 20.h,
                                                                minWidth: 50.w),
                                                        prefixIconConstraints:
                                                            BoxConstraints(
                                                                minHeight: 20.h,
                                                                minWidth: 40.w),
                                                        obscureText: false,
                                                        controller: _cubit.ocr,
                                                      ),
                                                      SizedBox(
                                                        height: 30.h,
                                                      ),
                                                      CustomDropDown(
                                                        prefixIcon: Icon(
                                                          CustomIcons.document,
                                                          color: AppColors
                                                              .greyColor,
                                                          size: 16.sp,
                                                        ),
                                                        labelText:
                                                            "حدد التقييم",
                                                        items: _cubit.feedBacks,
                                                        hintText: "حدد التقييم",
                                                        selectedItem: _cubit
                                                            .selectedFeedBack,
                                                        onChanged:
                                                            (String? newValue) {
                                                          _cubit.selectFeedBack(
                                                              newValue);
                                                        },
                                                      ),
                                                      SizedBox(
                                                        height: 30.h,
                                                      ),
                                                      GestureDetector(
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              color: Color(
                                                                  0xFF0cad39),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.r)),
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        30.w,
                                                                    vertical:
                                                                        10.h),
                                                            child: Text(
                                                                AppStrings
                                                                    .approve
                                                                    .tr(),
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        18.sp)),
                                                          ),
                                                        ),
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                          _cubit.confirmLPR(_cubit
                                                                  .pendingLPRsCars[
                                                                      index]
                                                                  .carId ??
                                                              0);
                                                        },
                                                      )
                                                    ],
                                                  ),
                                                );
                                              });
                                        },
                                        child: CarCard(
                                          carModel: HomeCubit.get(context)
                                              .pendingLPRsCars[index],
                                        ),
                                      );
                                    },
                                    itemCount: HomeCubit.get(context)
                                        .pendingLPRsCars
                                        .length, // Number of items
                                  ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: SizedBox(
            height: 40.h,
            width: 75.h,
            child: FloatingActionButton(
              onPressed: () {
                _cubit.getPendingLPRs();
              },
              tooltip: 'Refresh',
              backgroundColor: Colors.red[800],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "تحميل",
                    style:
                        TextStyle(color: Colors.white, fontSize: 20.sp),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Icon(
                    Icons.refresh,
                    color: Colors.white,
                  ),
                ],
              ),
              elevation: 15,
            ),
          ),
        );
      },
    );
  }
}
