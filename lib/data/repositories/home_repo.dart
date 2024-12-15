import 'package:dartz/dartz.dart';
import '../../core/errors/exceptions.dart';
import '../../core/errors/failures.dart';
import '../../core/network/nework_info.dart';
import '../datasources/remote_data_source.dart';
import '../models/response/get_cars_response/get_cars_reponse.dart';
import '../models/response/notification_response/get_notification_response.dart';

abstract class HomeRepository {
  Future<Either<Failure, GetCarsResponse>> getPendingLPRs(
      {required int userNumber, required int languageCode});

  Future<Either<Failure, String>> confirmLPR({
    required int userNumber,
    required int cardId,
    required String ocr,
    required String feedBack,
    required int languageCode,
  });

  Future<Either<Failure, String>> addLPR({
    required int userNumber,
    required String cameraName,
    required int cardId,
    required String ocr,
    required DateTime date,
    required int languageCode,
    required String imag
  });

  Future<Either<Failure, GetNotificationResponse>> getNotification(
      {required int userNumber, required int languageCode});
}

class HomeRepositoryImpl extends HomeRepository {
  final RemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  HomeRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, GetCarsResponse>> getPendingLPRs(
      {required int userNumber, required int languageCode}) async {
    if (await networkInfo.isConnected == false) {
      return const Left(DeviceConnectivityFailure());
    }
    try {
      GetCarsResponse result = await remoteDataSource.getPendingLPRs(
          userNumber: userNumber, languageCode: languageCode);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> confirmLPR({
    required int userNumber,
    required int cardId,
    required String ocr,
    required String feedBack,
    required int languageCode,
  }) async {
    if (await networkInfo.isConnected == false) {
      return const Left(DeviceConnectivityFailure());
    }
    try {
      String result = await remoteDataSource.confirmLPR(
          userNumber: userNumber,
          languageCode: languageCode,
          cardId: cardId,
          ocr: ocr,
          feedBack: feedBack);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, GetNotificationResponse>> getNotification(
      {required int userNumber, required int languageCode}) async {
    if (await networkInfo.isConnected == false) {
      return const Left(DeviceConnectivityFailure());
    }
    try {
      GetNotificationResponse result = await remoteDataSource.getNotification(
          userNumber: userNumber, languageCode: languageCode);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> addLPR({
    required int userNumber,
    required String cameraName,
    required int cardId,
    required String ocr,
    required DateTime date,
    required String imag,
    required int languageCode,
  }) async {
    if (await networkInfo.isConnected == false) {
      return const Left(DeviceConnectivityFailure());
    }
    try {
      String result = await remoteDataSource.addLPR(
          userNumber: userNumber,
          cameraName: cameraName,
          cardId: cardId,
          ocr: ocr,
          date: date,
          imag:imag,
          languageCode: languageCode);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
