// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_cars_reponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetCarsResponseImpl _$$GetCarsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetCarsResponseImpl(
      message: json['message'] as String,
      data: CarNumberList.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GetCarsResponseImplToJson(
        _$GetCarsResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
