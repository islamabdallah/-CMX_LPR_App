import 'package:freezed_annotation/freezed_annotation.dart';


part 'car_number_model.freezed.dart';
part 'car_number_model.g.dart';
@freezed
class CarNumberModel with _$CarNumberModel {
  factory CarNumberModel({
    required final int? carId,
    required final String? camera_name,
    required final String? ocr,
    required final DateTime? date,
    required final String? imag,
  }) = _CarNumberModel;
  factory CarNumberModel.fromJson(Map<String, dynamic> json) =>
      _$CarNumberModelFromJson(json);
}
