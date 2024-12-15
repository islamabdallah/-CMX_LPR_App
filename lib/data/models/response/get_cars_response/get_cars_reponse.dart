import 'package:freezed_annotation/freezed_annotation.dart';
import '../../car_number_list/car_number_list.dart';
part 'get_cars_reponse.freezed.dart';
part 'get_cars_reponse.g.dart';
@freezed
class GetCarsResponse with _$GetCarsResponse{
  factory GetCarsResponse(
      {
         required final String message,
         required final CarNumberList data,
      }) =_GetCarsResponse;
  factory GetCarsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCarsResponseFromJson(json);
}