import 'package:flutter/material.dart';
import '../../data/datasources/secure_storage.dart';
import '../../logic/notification/notification_cubit.dart';
import '../screens/login/login_screen.dart';

void logOut(BuildContext context) {
  NotificationCubit.get(context).notifications.clear();
 // PushNotificationService.deleteDeviceToken();
  final secureStorage=SecureStorageImpl();
  secureStorage.deleteSecureData('user number');
  // SharedPreferences.getInstance().then((value) async {
  //   await value.reload();
  //   return value.clear();
  // });
  Navigator.of(context).pushNamedAndRemoveUntil(
      LoginScreen.routeName, (Route<dynamic> route) => false);
}