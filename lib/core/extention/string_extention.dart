import 'package:template/core/constants/app_enums.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

///*********** API Response Handling ****************

extension ApiResponseHandler<T> on Future<HttpResponse<T>> {
  Future<Either<String, T>> handleResponse() async {
    try {
      final response = await this;
      return right(response.data);
    } on DioException catch (e) {
      return left(_handleDioError(e));
    } catch (e) {
      return left('Unexpected error occurred: ${e.toString()}');
    }
  }

  /// Extracts error message from DioException
  String _handleDioError(DioException e) {
    if (e.response != null) {
      return _getErrorMessage(e.response!);
    }

    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timeout. Please try again.';
      case DioExceptionType.receiveTimeout:
        return 'Server took too long to respond.';
      case DioExceptionType.sendTimeout:
        return 'Request timed out.';
      case DioExceptionType.badCertificate:
        return 'Bad certificate error.';
      case DioExceptionType.cancel:
        return 'Request was cancelled.';
      case DioExceptionType.connectionError:
        return 'No internet connection.';
      case DioExceptionType.unknown:
      default:
        return 'Unknown network error occurred.';
    }
  }

  /// Extracts a meaningful error message from the response
  String _getErrorMessage(Response response) {
    if (response.data is Map<String, dynamic> && response.data.containsKey('message')) {
      return response.data['message'].toString();
    }
    return 'Error ${response.statusCode}: ${response.statusMessage ?? 'Something went wrong'}';
  }
}

extension MessageTypeExtension on MessageType {
  String get asString => toString().split('.').last;
}
