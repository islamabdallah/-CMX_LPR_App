// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationModelImpl _$$NotificationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationModelImpl(
      notificationId: (json['notificationId'] as num?)?.toInt(),
      carId: (json['carId'] as num?)?.toInt(),
      camera_name: json['camera_name'] as String?,
      ocr: json['ocr'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      imag: json['imag'] as String?,
    );

Map<String, dynamic> _$$NotificationModelImplToJson(
        _$NotificationModelImpl instance) =>
    <String, dynamic>{
      'notificationId': instance.notificationId,
      'carId': instance.carId,
      'camera_name': instance.camera_name,
      'ocr': instance.ocr,
      'date': instance.date?.toIso8601String(),
      'imag': instance.imag,
    };
