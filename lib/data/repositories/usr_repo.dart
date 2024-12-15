import 'package:dartz/dartz.dart';
import '../../core/errors/exceptions.dart';
import '../../core/errors/failures.dart';
import '../../core/network/nework_info.dart';
import '../datasources/remote_data_source.dart';
import '../datasources/secure_storage.dart';

abstract class UserRepository {
  Future<Either<Failure, int>> loginUser(
      {required int userNumber, required String password,required int languageCode});
}

class UserRepositoryImpl extends UserRepository{
  final SecureStorage secureStorage;
  final RemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  UserRepositoryImpl({
    required this.remoteDataSource,
   required this.secureStorage,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure,int>> loginUser(
      {required int userNumber, required String password,required int languageCode}) async {
    if (await networkInfo.isConnected == false) {
      return const Left(DeviceConnectivityFailure());
    }
    try {
      int result = await remoteDataSource.loginUser(
          password: password, userNumber:userNumber,languageCode: languageCode);
      secureStorage.writeSecureData('user number', result.toString());
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }




}