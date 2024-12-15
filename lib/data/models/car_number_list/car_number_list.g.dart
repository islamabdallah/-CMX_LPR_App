// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_number_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CarNumberListImpl _$$CarNumberListImplFromJson(Map<String, dynamic> json) =>
    _$CarNumberListImpl(
      camerasName: (json['camerasName'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      feedBacks:
          (json['feedBacks'] as List<dynamic>).map((e) => e as String).toList(),
      lPRs: (json['lPRs'] as List<dynamic>)
          .map((e) => CarNumberModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      notificationCount: (json['notificationCount'] as num).toInt(),
    );

Map<String, dynamic> _$$CarNumberListImplToJson(_$CarNumberListImpl instance) =>
    <String, dynamic>{
      'camerasName': instance.camerasName,
      'feedBacks': instance.feedBacks,
      'lPRs': instance.lPRs,
      'notificationCount': instance.notificationCount,
    };
