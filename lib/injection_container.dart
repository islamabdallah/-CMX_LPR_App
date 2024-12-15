import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/network/device_connectivity.dart';
import 'core/network/nework_info.dart';
import 'data/datasources/remote_data_source.dart';
import 'data/datasources/secure_storage.dart';
import 'data/repositories/home_repo.dart';
import 'data/repositories/usr_repo.dart';
import 'logic/home/home_cubit.dart';
import 'logic/login/login_cubit.dart';
import 'logic/notification/notification_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => LoginCubit(userRepository: sl()));
  sl.registerFactory(() => HomeCubit(homeRepository: sl()));
  sl.registerFactory(() => NotificationCubit(homeRepository: sl()));
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(
    remoteDataSource: sl(),networkInfo:sl(),secureStorage: sl()));
  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(
    remoteDataSource: sl(),networkInfo:sl(),));
  sl.registerLazySingleton<RemoteDataSource>(
          () => RemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<SecureStorage>(
          () =>  SecureStorageImpl());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton<DeviceConnectivity>(
          () => DeviceConnectivityImpl(sl()));
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => Connectivity());
 sl.registerLazySingleton(() => InternetConnectionChecker());
}
