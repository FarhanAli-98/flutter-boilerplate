import 'package:template/core/di/network_interceptor.dart';
import 'package:template/core/preferences/secure_storage.dart';
import 'package:template/data/services/api_services.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupLocator() {
  getIt.registerLazySingleton<SecureStorage>(() => SecureStorage());
  getIt.registerLazySingleton<Dio>(() {
    final dio = Dio();
    dio.options = requestHeader;
    dio.interceptors.add(NetworkInterceptor(getIt<SecureStorage>()));
    return dio;
  });
  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<Dio>()));
}
