import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:http/http.dart' as http;
import '../../core/constants/api_paths.dart';
import '../../core/constants/app_strings.dart';
import '../../core/errors/exceptions.dart';
import '../models/response/get_cars_response/get_cars_reponse.dart';
import '../models/response/notification_response/get_notification_response.dart';

abstract class RemoteDataSource {
  Future<int> loginUser({
    required int userNumber,
    required String password,
    required int languageCode,
  });

  Future<GetCarsResponse> getPendingLPRs({
    required int userNumber,
    required int languageCode,
  });

  Future<String> confirmLPR({
    required int userNumber,
    required int cardId,
    required String ocr,
    required String feedBack,
    required int languageCode,
  });

  Future<GetNotificationResponse> getNotification({
    required int userNumber,
    required int languageCode,
  });

  Future<String> addLPR({
    required int userNumber,
    required String cameraName,
    required int cardId,
    required String ocr,
    required DateTime date,
    required int languageCode,
    required String imag,
  });
}

class RemoteDataSourceImpl extends RemoteDataSource {
  final http.Client client;

  RemoteDataSourceImpl({required this.client});
  @override
  Future<int> loginUser(
      {required int userNumber,
      required String password,
      required int languageCode}) async {
    final response = await client.post(Uri.parse(AppEndpoints.userLogin),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
          {"UserNumber": userNumber, "Password": password, "LanguageId": languageCode},
        ));
    if (response.statusCode == 200) {
      Map<String, dynamic> result = jsonDecode(response.body);
      return result['data'];
    } else {
      Map<String, dynamic> result = jsonDecode(response.body);
      if (result.isNotEmpty && result['message'] != null) {
        throw ServerException(result['message']);
      } else {
        throw ServerException(AppStrings.someThingWentWrong.tr());
      }
    }
  }


  @override

  Future<GetCarsResponse> getPendingLPRs({
    required int userNumber,
    required int languageCode,
  })async
  {
    final response = await client.post(
      Uri.parse(AppEndpoints.pendingLPR).replace(
          queryParameters:{
            "UserNumber":userNumber.toString(),
            "LanguageId": languageCode.toString()
          }),
        headers: {
          'Content-Type': 'application/json',
        },
        );
    if (response.statusCode == 200) {
      Map<String, dynamic> result = jsonDecode(response.body);
      GetCarsResponse pendingLPRsResponse=GetCarsResponse.fromJson(result);
      return pendingLPRsResponse;
    } else {
      Map<String, dynamic> result = jsonDecode(response.body);
      if (result.isNotEmpty && result['message'] != null) {
        throw ServerException(result['message']);
      } else {
        throw ServerException(AppStrings.someThingWentWrong.tr());
      }
    }
  }
  @override
  Future<String> confirmLPR({
    required int userNumber,
    required int cardId,
    required String ocr,
    required String feedBack,
    required int languageCode,
  })async
  {
    final response = await client.post(
      Uri.parse(AppEndpoints.confirmLPR),
      body: jsonEncode({
        "userNumber":userNumber,
        "carId":cardId,
        "ocr": ocr,
        "feedBack": feedBack,
        "LanguageId":languageCode
      }),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    Map<String, dynamic> result = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return result['message'];
    } else {
      if (result.isNotEmpty && result['message'] != null) {
        throw ServerException(result['message']);
      } else {
        throw ServerException(AppStrings.someThingWentWrong.tr());
      }
    }
  }
  @override
  Future<GetNotificationResponse> getNotification({
    required int userNumber,
    required int languageCode,
  })async
  {
    final response = await client.post(
      Uri.parse(AppEndpoints.getNotification).replace(
          queryParameters:{
            "UserNumber":userNumber.toString(),
            "LanguageId": languageCode.toString()
          }),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    Map<String, dynamic> result = jsonDecode(response.body);
    if (response.statusCode == 200) {
      GetNotificationResponse notificationResponse=GetNotificationResponse.fromJson(result);
      return notificationResponse;
    } else {
      if (result.isNotEmpty && result['message'] != null) {
        throw ServerException(result['message']);
      } else {
        throw ServerException(AppStrings.someThingWentWrong.tr());
      }
    }
  }


  @override
  Future<String> addLPR({
    required int userNumber,
    required String cameraName,
    required int cardId,
    required String ocr,
    required DateTime date,
    required int languageCode,
    required  String imag
  })async
  {
    final response = await client.post(
      Uri.parse(AppEndpoints.addLPR),
      body: jsonEncode({
        "userNumber":userNumber,
        "camera_name":cameraName,
        "carId":cardId,
        "ocr": ocr,
        "date":date.toString(),
        "LanguageId":languageCode,
        "imag":imag
      }),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    print({
      "userNumber":userNumber,
      "camera_name":cameraName,
      "carId":cardId,
      "ocr": ocr,
      "date":date.toString(),
      "LanguageId":languageCode,
      "imag":imag
    });
    Map<String, dynamic> result = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return result['message'];
    } else {
      if (result.isNotEmpty && result['message'] != null) {
        throw ServerException(result['message']);
      } else {
        throw ServerException(AppStrings.someThingWentWrong.tr());
      }
    }
  }
}
