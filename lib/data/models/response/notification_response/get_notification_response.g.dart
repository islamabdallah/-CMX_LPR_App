// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_notification_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetNotificationResponseImpl _$$GetNotificationResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetNotificationResponseImpl(
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => NotificationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetNotificationResponseImplToJson(
        _$GetNotificationResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
