import 'dart:async';
import 'dart:convert';

import 'package:template/core/constants/app_constants.dart';
import 'package:template/core/preferences/secure_storage.dart';
import 'package:template/core/resources/routes/app_navigation.dart';
import 'package:template/core/resources/routes/app_routes.dart';
import 'package:dio/dio.dart';

class NetworkInterceptor extends Interceptor {
  final SecureStorage secureStorage;
  List<Map<dynamic, dynamic>> failedRequests = [];
  bool isRefreshing = false;

  NetworkInterceptor(this.secureStorage);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // final user = await getIt<UserRepository>().loadUser();
    // final token = user?.accessToken;
    // if (token != null) {
    //   options.headers["Authorization"] = "Bearer $token";
    // }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    /* if (err.response?.statusCode == 401 && err.response?.data['message'] == "Invalid token.") {
      final user = await getIt<UserRepository>().loadUser();
      final refreshToken = user?.refreshToken;

      if (refreshToken == null) {
        secureStorage.clearToken();
        AppNavigation.pushAndKillAll(AppRoutes.loginRoute);
        return handler.reject(err);
      }

      if (!isRefreshing) {
        isRefreshing = true;
        bool refreshSuccess = await refreshTokens(refreshToken);

        if (refreshSuccess) {
          retryRequests();
        } else {
          secureStorage.clearToken();
          AppNavigation.pushAndKillAll(AppRoutes.loginRoute);
          return handler.reject(err);
        }
      } else {
        failedRequests.add({'err': err, 'handler': handler});
      }
    } else {
      return handler.next(err);
    }*/
  }

  /// Refresh Access Token
  //TODO: Upgrate this in professional way
  Future<bool> refreshTokens(String refreshToken) async {
    String baseUrl = AppConstant.baseUrl;
    Dio dio = Dio(requestHeader);

    try {
      var response = await dio.post(
        '${baseUrl}auth/updateAccessToken',
        data: jsonEncode({"refreshToken": refreshToken}),
      );

      /*if (response.statusCode == 200 && response.data['accessToken'] != null) {
        final newAccessToken = response.data['accessToken'];

        // Update User Data
        final prefs = await BasePreferences.getSecurePref(AppConstant.userKey);
        if (prefs == null) return false;

        User user = User.fromJson(jsonDecode(prefs));
        user.accessToken = newAccessToken;

        await BasePreferences.saveSecurePref(AppConstant.userKey, jsonEncode(user));
        getIt<SecureStorage>().saveToken(newAccessToken);

        isRefreshing = false;
        return true;
      } else {
        return false;
      }*/
      return false;
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 403) {
        secureStorage.clearToken();
        AppNavigation.pushAndKillAll(AppRoutes.loginRoute);
        return false;
      }
      return false;
    }
  }

  /// Retry Failed Requests
  Future<void> retryRequests() async {
    if (failedRequests.isEmpty) return;
/*

    final user = await getIt<UserRepository>().loadUser();
    final token = user?.accessToken;
    if (token == null) return;

    Dio retryDio = Dio();

    for (var request in failedRequests) {
      RequestOptions requestOptions = request['err'].requestOptions;
      requestOptions.headers["Authorization"] = "Bearer $token";

      try {
        Response response = await retryDio.fetch(requestOptions);
        request['handler'].resolve(response);
      } catch (error) {
        request['handler'].reject(error as DioException);
      }
    }
*/

    failedRequests.clear();
  }
}

final requestHeader = BaseOptions(
  baseUrl: AppConstant.baseUrl,
  connectTimeout: const Duration(seconds: 10),
  receiveTimeout: const Duration(seconds: 10),
  headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  },
);
