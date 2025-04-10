import 'package:template/core/constants/app_constants.dart';
import 'package:template/core/di/di.dart';
import 'package:template/core/di/network_interceptor.dart';
import 'package:template/core/preferences/secure_storage.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';

part 'api_services.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl = AppConstant.baseUrl}) {
    dio.options.baseUrl = baseUrl;
    dio.interceptors.add(NetworkInterceptor(getIt<SecureStorage>()));
    dio.interceptors.add(
      TalkerDioLogger(
        settings: const TalkerDioLoggerSettings(
          printRequestHeaders: true,
          printResponseHeaders: true,
          printResponseMessage: true,
        ),
      ),
    );

    return _ApiService(dio);
  }
}
