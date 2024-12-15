import 'package:freezed_annotation/freezed_annotation.dart';
import '../../notification_model/notification_model.dart';
part 'get_notification_response.freezed.dart';
part 'get_notification_response.g.dart';
@freezed
class GetNotificationResponse with _$GetNotificationResponse{
  factory GetNotificationResponse(
      {
        required final String message,
        required final List<NotificationModel> data,
      }) =_GetNotificationResponse;
  factory GetNotificationResponse.fromJson(Map<String, dynamic> json) =>
      _$GetNotificationResponseFromJson(json);
}