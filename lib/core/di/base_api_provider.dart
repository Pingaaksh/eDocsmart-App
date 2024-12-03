import 'dart:async';
import 'package:skin_match/core/common/app_common_exports.dart';
import 'package:dio/dio.dart' as dio_res;
import 'package:dio/dio.dart';
import 'package:get/get.dart';

abstract class BaseApiProvider {
  Future<dio_res.Response> postMethod(
    String? url,
    Map<String, dynamic> body, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    Progress? uploadProgress,
    Map<String, File?>? imageFiles,
    dio_res.CancelToken? cancelToken,
  });

  Future<dio_res.Response> postMethodDynamicRequest(
    String? url,
    dynamic body, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    decoder,
    uploadProgress,
    dio_res.CancelToken? cancelToken,
  });

  Future<dio_res.Response> getMethod(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    Decoder? decoder,
    dio_res.CancelToken? cancelToken,
  });

  Future<dio_res.Response> putMethod(
    String url,
    Map<String, dynamic> body, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    Progress? uploadProgress,
    dio_res.CancelToken? cancelToken,
  });

  Future<dio_res.Response> patchMethod(
    String url,
    Map<String, dynamic> body, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    Progress? uploadProgress,
    MapEntry<String, dio_res.MultipartFile>? imageFiles,
    dio_res.CancelToken? cancelToken,
  });

  Future<dio_res.Response> requestMethod(
    String url,
    String method, {
    Map<String, dynamic> body,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    Progress? uploadProgress,
    dio_res.CancelToken? cancelToken,
  });

  Future<dio_res.Response> deleteMethod(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    dio_res.CancelToken? cancelToken,
  });
}

class BaseApiProviderImpl implements BaseApiProvider {
  BaseApiProviderImpl._privateConstructor() {
    onInit();
  }

  BaseApiProviderImpl();

  static final BaseApiProviderImpl _instance =
      BaseApiProviderImpl._privateConstructor();

  static BaseApiProviderImpl get instance => _instance;

  final NetworkService _networkService = Get.find();
  final _dio = dio_res.Dio();
  final sharedPreference = Get.find<SharedPreferenceService>();

  void onInit() {
    _dio.options
      ..baseUrl = ApiClient.baseUrl
      ..contentType = ApiClient.jsonHeaderValue
      ..connectTimeout = Duration(seconds: ApiClient.timeoutSec)
      ..receiveTimeout = Duration(seconds: ApiClient.receiveTimeoutSec)
      ..validateStatus = (int? status) {
        return status != null && status > 0;
      };
    _dio.interceptors.add(
      dio_res.InterceptorsWrapper(
        onRequest: (options, handler) async {
          var token = await sharedPreference.getToken();
          if (token?.isNotEmpty ?? false) {
            options.headers['Authorization'] = 'Bearer $token';
            Logger.write('@87 we got token $token for ${options.uri}');
          }
          return handler.next(options);
        },
        onResponse: (response, handler) {
          Logger.write(
            '${response.requestOptions.method.toUpperCase()} : ${response.requestOptions.uri} ',
          );
          // '\nHeader : ${response.headers}');

          Logger.write('\nRequest Parameter '
              '\n${response.requestOptions.data?.toString()}\n'
              'Query Parameter ${response.requestOptions.queryParameters.toString()}');

          Logger.write(
            'Response Parameter \n${response.statusCode} : ${response.statusMessage}\n${response.data.toString()}',
          );

          return handler.next(response);
        },
        onError: (exception, handler) {
          handleError(exception);
          return handler.next(exception);
        },
      ),
    );
  }

  @protected
  @override
  Future<dio_res.Response> postMethod(
    String? url,
    Map<String, dynamic> body, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    decoder,
    uploadProgress,
    Map<String, File?>? imageFiles,
    dio_res.CancelToken? cancelToken,
  }) async {
    if (await _networkService.isConnected()) {
      try {
        debugPrint('@146 Request:: ${body.toString()}');
        dio_res.FormData formData = dio_res.FormData.fromMap(body);
        if (imageFiles != null && imageFiles.isNotEmpty) {
          for (String key in imageFiles.keys) {
            formData.files.add(
              MapEntry(
                key,
                await dio_res.MultipartFile.fromFile(
                  imageFiles[key]?.path ?? '',
                ),
              ),
            );
          }
        }
        var response = await _dio.post(
          url ?? '',
          data: formData,
          options: Options(
            headers: headers,
          ),
          cancelToken: cancelToken,
          queryParameters: query,
        );
        await checkAuthorize(
          response.statusCode ?? 0,
          response.statusMessage ?? '',
        );
        Logger.write(response.data.toString());
        return response;
      } catch (exception) {
        if (exception is SocketException) {
          throw CustomException(LocaleKeys.noInternetConnection.tr);
        } else if (exception is TimeoutException) {
          throw CustomException(LocaleKeys.someThingWentWrong.tr);
        } else if (exception is dio_res.DioException) {
          checkAuthorize(
            exception.response?.statusCode ?? 0,
            exception.response?.statusMessage ?? '',
          );
        }
        debugPrint('@122 ${exception.toString()}');
        rethrow;
      }
    } else {
      throw CustomException(LocaleKeys.noInternetConnection.tr);
    }
  }

  @protected
  @override
  Future<dio_res.Response> getMethod(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    decoder,
    dio_res.CancelToken? cancelToken,
  }) async {
    if (await _networkService.isConnected()) {
      // debugPrint('@148 ::: ${query.toString()}');
      try {
        var response = await _dio.get(
          url,
          options: Options(headers: headers),
          queryParameters: query,
          cancelToken: cancelToken,
        );
        await checkAuthorize(
          response.statusCode ?? 0,
          response.statusMessage ?? '',
        );
        return response;
      } catch (exception) {
        if (exception is SocketException) {
          throw CustomException(LocaleKeys.noInternetConnection.tr);
        } else if (exception is TypeError) {
          throw CustomException(LocaleKeys.someThingWentWrong.tr);
        } else if (exception is dio_res.DioException) {
          checkAuthorize(
            exception.response?.statusCode ?? 0,
            exception.response?.statusMessage ?? '',
          );
        } else if (exception is TimeoutException) {
          throw CustomException(LocaleKeys.someThingWentWrong.tr);
        }
        rethrow;
      }
    } else {
      throw CustomException(LocaleKeys.noInternetConnection.tr);
    }
  }

  @protected
  @override
  Future<dio_res.Response> putMethod(
    String url,
    Map<String, dynamic> body, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    decoder,
    uploadProgress,
    dio_res.CancelToken? cancelToken,
  }) async {
    if (await _networkService.isConnected()) {
      try {
        dio_res.FormData formData = dio_res.FormData.fromMap(body);
        var response = await _dio.put(
          url,
          options: Options(
            headers: headers,
          ),
          data: formData,
          queryParameters: query,
          cancelToken: cancelToken,
        );
        await checkAuthorize(
          response.statusCode ?? 0,
          response.statusMessage ?? '',
        );
        return response;
      } catch (exception) {
        if (exception is SocketException) {
          throw CustomException(LocaleKeys.noInternetConnection.tr);
        } else if (exception is TimeoutException) {
          throw CustomException(LocaleKeys.someThingWentWrong.tr);
        } else if (exception is dio_res.DioException) {
          checkAuthorize(
            exception.response?.statusCode ?? 0,
            exception.response?.statusMessage ?? '',
          );
        }
        rethrow;
      }
    } else {
      throw CustomException(LocaleKeys.noInternetConnection.tr);
    }
  }

  @protected
  @override
  Future<dio_res.Response> patchMethod(
    String url,
    Map<String, dynamic> body, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    decoder,
    uploadProgress,
    MapEntry<String, dio_res.MultipartFile>? imageFiles,
    dio_res.CancelToken? cancelToken,
  }) async {
    if (await _networkService.isConnected()) {
      try {
        dio_res.FormData formData = dio_res.FormData.fromMap(body);
        if (imageFiles != null) formData.files.add(imageFiles);
        var response = await _dio.patch(
          url,
          data: (headers != ApiClient.applicationJsonHeader) ? formData : body,
          options: Options(headers: headers),
          queryParameters: query,
          cancelToken: cancelToken,
        );
        await checkAuthorize(
          response.statusCode ?? 0,
          response.statusMessage ?? '',
        );
        return response;
      } catch (exception) {
        if (exception is SocketException) {
          throw CustomException(LocaleKeys.noInternetConnection.tr);
        } else if (exception is TimeoutException) {
          throw CustomException(LocaleKeys.someThingWentWrong.tr);
        } else if (exception is dio_res.DioException) {
          checkAuthorize(
            exception.response?.statusCode ?? 0,
            exception.response?.statusMessage ?? '',
          );
        }
        rethrow;
      }
    } else {
      throw CustomException(LocaleKeys.noInternetConnection.tr);
    }
  }

  @protected
  @override
  Future<dio_res.Response> requestMethod(
    String url,
    String method, {
    Map<String, dynamic> body = const {},
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    uploadProgress,
    dio_res.CancelToken? cancelToken,
  }) async {
    if (await _networkService.isConnected()) {
      try {
        var response = await _dio.request(
          url,
          options: Options(headers: headers),
          queryParameters: query,
          cancelToken: cancelToken,
        );
        await checkAuthorize(
          response.statusCode ?? 0,
          response.statusMessage ?? '',
        );
        return response;
      } catch (exception) {
        if (exception is SocketException) {
          throw CustomException(LocaleKeys.noInternetConnection.tr);
        } else if (exception is TimeoutException) {
          throw CustomException(LocaleKeys.someThingWentWrong.tr);
        } else if (exception is dio_res.DioException) {
          checkAuthorize(
            exception.response?.statusCode ?? 0,
            exception.response?.statusMessage ?? '',
          );
        }
        rethrow;
      }
    } else {
      throw CustomException(LocaleKeys.noInternetConnection.tr);
    }
  }

  @protected
  @override
  Future<dio_res.Response> deleteMethod(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    dio_res.CancelToken? cancelToken,
  }) async {
    if (await _networkService.isConnected()) {
      try {
        var response = await _dio.delete(
          url,
          options: Options(headers: headers),
          cancelToken: cancelToken,
          queryParameters: query,
        );
        await checkAuthorize(
          response.statusCode ?? 0,
          response.statusMessage ?? '',
        );
        return response;
      } catch (exception) {
        if (exception is SocketException) {
          throw CustomException(LocaleKeys.noInternetConnection.tr);
        } else if (exception is TimeoutException) {
          throw CustomException(LocaleKeys.someThingWentWrong.tr);
        } else if (exception is dio_res.DioException) {
          checkAuthorize(
            exception.response?.statusCode ?? 0,
            exception.response?.statusMessage ?? '',
          );
        }
        rethrow;
      }
    } else {
      throw CustomException(LocaleKeys.noInternetConnection.tr);
    }
  }

  @protected
  @override
  Future<dio_res.Response> postMethodDynamicRequest(
    String? url,
    dynamic body, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    decoder,
    uploadProgress,
    dio_res.CancelToken? cancelToken,
  }) async {
    if (await _networkService.isConnected()) {
      try {
        var response = await _dio.post(
          url ?? '',
          data: body,
          options: Options(
            headers: headers,
          ),
          cancelToken: cancelToken,
          queryParameters: query,
        );
        Logger.write(response.data.toString());
        await checkAuthorize(
          response.statusCode ?? 0,
          response.statusMessage ?? '',
        );
        return response;
      } catch (exception) {
        if (exception is SocketException) {
          throw CustomException(LocaleKeys.noInternetConnection.tr);
        } else if (exception is TimeoutException) {
          throw CustomException(LocaleKeys.someThingWentWrong.tr);
        } else if (exception is dio_res.DioException) {
          checkAuthorize(
            exception.response?.statusCode ?? 0,
            exception.response?.statusMessage ?? '',
          );
        }
        debugPrint('@388 ${exception.toString()}');
        rethrow;
      }
    } else {
      throw CustomException(LocaleKeys.noInternetConnection.tr);
    }
  }
}

void handleError(DioException exception) {
  switch (exception.type) {
    case DioExceptionType.connectionTimeout:
      // TODO: Handle this case.
      break;
    case DioExceptionType.sendTimeout:
      // TODO: Handle this case.
      break;
    case DioExceptionType.receiveTimeout:
      // TODO: Handle this case.
      break;
    case DioExceptionType.badResponse:
      // TODO: Handle this case.
      break;
    case DioExceptionType.cancel:
      // TODO: Handle this case.
      break;
    case DioExceptionType.unknown:
      // TODO: Handle this case.
      break;
    case DioExceptionType.badCertificate:
      // TODO: Handle this case.
      break;
    case DioExceptionType.connectionError:
      // TODO: Handle this case.
      break;
  }
}

Future<void> checkAuthorize(int statusCode, String message) async {
  if (statusCode == 401) {
    sessionExpiredDialog();
    // throw CustomException(LocaleKeys.someThingWentWrong.tr);
  } else if (statusCode == 200) {
  } else {
    CustomException(message);
  }
}
