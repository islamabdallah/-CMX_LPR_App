
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lpr/presentation/screens/notification/widgets/notification.dart';
import 'package:lpr/presentation/utils/loading_dialog.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../injection_container.dart';
import '../../../logic/notification/notification_cubit.dart';
import '../../../logic/notification/notification_state.dart';
import '../../utils/message_dialog.dart';

class NotificationScreen extends StatefulWidget {
  static const routeName = 'NotificationScreen';

  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState()
  {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      NotificationCubit.get(context).getNotification();
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotificationCubit, NotificationStates>(
      listener: (context, state) {
        if (state is NotificationLoadingState) {
          loadingAlertDialog(context);
        }
        if (state is NotificationSuccessState ) {
          if(Navigator.canPop(context))
            {
              Navigator.pop(context);
            }
        }
        if (state is NotificationErrorState) {
          Navigator.pop(context);
          showMessageDialog(
              context: context,
              isSucceeded: false,
              message: state.message);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              AppStrings.notifications.tr(),
              style: TextStyle(
                  color: AppColors.mainColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.all(16.0.w),
            child: ListView.separated(
              itemBuilder: (context, index) {
                return NotificationCard(
                  notificationModel: NotificationCubit.get(context).notifications[index],
                ) ;
              },
              itemCount: NotificationCubit.get(context).notifications.length,
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  indent: 10.w,
                  endIndent: 10.w,
                  color: AppColors.greyColor,
                  thickness: 0.1.w,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
