import 'package:freezed_annotation/freezed_annotation.dart';


part 'notification_model.freezed.dart';
part 'notification_model.g.dart';
@freezed
class NotificationModel with _$NotificationModel{
  factory NotificationModel({
    required final int? notificationId,
    required final int? carId,
    required final String? camera_name,
    required final String? ocr,
    required final DateTime? date,
    required final String? imag,
  }) = _NotificationModel;
  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
}
