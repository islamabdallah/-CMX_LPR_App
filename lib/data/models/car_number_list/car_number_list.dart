import 'package:freezed_annotation/freezed_annotation.dart';
import '../car_number_model/car_number_model.dart';


part 'car_number_list.freezed.dart';
part 'car_number_list.g.dart';
@freezed
class CarNumberList with _$CarNumberList{
  factory CarNumberList(
      {
        required final List<String> camerasName,
        required final List<String> feedBacks,
        required final List<CarNumberModel>lPRs,
        required final int notificationCount
      }) =_CarNumberList;
  factory CarNumberList.fromJson(Map<String, dynamic> json) =>
      _$CarNumberListFromJson(json);
}