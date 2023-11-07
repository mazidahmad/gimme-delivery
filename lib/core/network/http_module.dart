import 'package:dio/dio.dart';
import 'package:gimme_delivery/core/config/env.dart';
import 'package:gimme_delivery/core/error/network_exception.dart';
import 'package:gimme_delivery/core/network/logging_interceptor.dart';
import 'package:gimme_delivery/core/network/response.dart';

class HttpModule {
  late Dio _client;

  HttpModule({String baseUrl = Env.mapBoxApi}) {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: baseUrl,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    _client = Dio(baseOptions);
    _client.interceptors.addAll([
      LoggingInterceptor(),
    ]);
  }

  void overrideAuthorizationHeader(String token) {
    _client.options.headers['Authorization'] = 'Bearer $token';
  }

  void clearToken(String token) {
    _client.options.headers.remove('Authorization');
  }

  Future<ResponseParser<dynamic>> _callAdapter(
      Future<Response<dynamic>> method) async {
    try {
      var result = await method;

      if (result.data is List<int>) {
        return ResponseParser(
            code: result.statusCode ?? 0,
            status: ResponseStatus.success,
            data: result.data,
            message: 'Success');
      }

      return ResponseParser(
          code: result.statusCode ?? 0,
          status: ResponseStatus.success,
          data: result.data,
          message: result.statusMessage ?? '');
    } on DioException catch (err) {
      String message =
          err.response?.statusMessage ?? err.message ?? 'Something Went Wrong';
      int? errCode = err.response?.statusCode;

      List<DioExceptionType> dioTimeout = [
        DioExceptionType.sendTimeout,
        DioExceptionType.receiveTimeout,
        DioExceptionType.connectionTimeout,
      ];

      if (dioTimeout.any((e) => err.type == e)) {
        throw NetworkException(errMessage: message);
      }

      if (errCode == null) {
        throw ClientException(errMessage: message);
      } else if (errCode >= 400 && errCode < 500) {
        if (errCode == 401) {
          throw const SessionException();
        }
        throw RequestException(message);
      } else if (errCode >= 500) {
        throw ServerException(errMessage: message);
      } else {
        throw ClientException(errMessage: message);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<ResponseParser<dynamic>> sendPostRequest(
    String path, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? params,
    dynamic data,
    void Function(int, int)? onSendProgress,
  }) async {
    var response = await _callAdapter(
      _client.post(
        path,
        data: data,
        queryParameters: params,
        options: Options(headers: headers),
        onSendProgress: onSendProgress,
      ),
    );

    return response;
  }

  Future<ResponseParser<dynamic>> sendPatchRequest(
    String path, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? params,
    dynamic data,
    void Function(int, int)? onSendProgress,
  }) async {
    var response = await _callAdapter(
      _client.patch(
        path,
        data: data,
        queryParameters: params,
        options: Options(headers: headers),
        onSendProgress: onSendProgress,
      ),
    );

    return response;
  }

  Future<ResponseParser<dynamic>> sendGetRequest(
    String path, {
    Map<String, dynamic>? headers,
    Options? options,
    void Function(int, int)? onReceiveProgress,
  }) async {
    var response = await _callAdapter(
      _client.get(
        path,
        onReceiveProgress: onReceiveProgress,
        options: options ?? Options(headers: headers),
      ),
    );

    return response;
  }

  Future<ResponseParser<dynamic>> sendPutRequest(
    String path, {
    Map<String, dynamic>? headers,
    dynamic data,
  }) async {
    var response = await _callAdapter(
      _client.put(
        path,
        data: data,
        options: Options(headers: headers),
      ),
    );

    return response;
  }

  Future<ResponseParser<dynamic>> sendDeleteRequest(
    String path, {
    Map<String, dynamic>? headers,
    dynamic data,
  }) async {
    var response = await _callAdapter(
      _client.delete(
        path,
        data: data,
        options: Options(headers: headers),
      ),
    );

    return response;
  }
}
