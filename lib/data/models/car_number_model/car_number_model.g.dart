// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_number_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CarNumberModelImpl _$$CarNumberModelImplFromJson(Map<String, dynamic> json) =>
    _$CarNumberModelImpl(
      carId: (json['carId'] as num?)?.toInt(),
      camera_name: json['camera_name'] as String?,
      ocr: json['ocr'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      imag: json['imag'] as String?,
    );

Map<String, dynamic> _$$CarNumberModelImplToJson(
        _$CarNumberModelImpl instance) =>
    <String, dynamic>{
      'carId': instance.carId,
      'camera_name': instance.camera_name,
      'ocr': instance.ocr,
      'date': instance.date?.toIso8601String(),
      'imag': instance.imag,
    };
