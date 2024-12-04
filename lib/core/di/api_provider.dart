import 'package:skin_match/core/common/app_common_exports.dart';

abstract class IApiProvider {
  Future<ResponseHandler?> login(Map<String, dynamic> request);

  Future<ResponseHandler?> sendOTP(String email);

  Future<ResponseHandler?> verifyOTP(Map<String, dynamic> request);

  Future<ResponseHandler?> resetPassword(Map<String, dynamic> request);
}

class ApiProvider extends IApiProvider {
  final BaseApiProvider iBaseApiProvider;

  ApiProvider(this.iBaseApiProvider);

  @override
  Future<ResponseHandler?> login(Map<String, dynamic> request) async {
    try {
      var response = await iBaseApiProvider.postMethod(
        ApiClient.login,
        request,
      );
      dynamic data1 = {
        'error': false,
        'status': 200,
        'message': 'Success.',
        'result' : {
          'refresh': 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczMzQwMTc4NCwiaWF0IjoxNzMzMzE1Mzg0LCJqdGkiOiJjMjEzYTlkNjVkYjI0NGIxOGNjZWIyNDExZmIxOTBhOCIsInVzZXJfaWQiOjd9.d_GnXog1f0k0qdyGcLNDYdXqZ3omPjqaMQfvUfoXJ-M',
          'access': 'aaeyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzMzMzE2NTg0LCJpYXQiOjE3MzMzMTUzODQsImp0aSI6ImI2N2UzZTY4ZjE2ZTRkMGZhMGJhM2RkYjQzNzBhMzI5IiwidXNlcl9pZCI6N30.neckSetYwCFFDXllxTNbxjBn08AS5eC_gDIgXPEbkco',
        },
      };

      ResponseHandler? responseHandler = ResponseHandler.fromJson(data1);
      responseHandler.httpStatus = 200 ?? defaultHttpStatusCode;
      return responseHandler;
    } on Exception catch (e, s) {
      Logger.write('@42 error is $e $s');
      rethrow;
    }
  }

  @override
  Future<ResponseHandler?> sendOTP(String email) async {
    try {
      var response = await iBaseApiProvider.postMethod(
        ApiClient.forgotPassword,
        {'email': email},
      );
      ResponseHandler? responseHandler = ResponseHandler.fromJson(response.data);
      responseHandler.httpStatus = response.statusCode ?? defaultHttpStatusCode;
      return responseHandler;
    } on Exception catch (e, s) {
      Logger.write('@42 error is $e $s');
      rethrow;
    }
  }

  @override
  Future<ResponseHandler?> verifyOTP(Map<String, dynamic> request) async {
    try {
      var response = await iBaseApiProvider.postMethod(
        ApiClient.verifyOTP,
        request,
      );
      ResponseHandler? responseHandler = ResponseHandler.fromJson(response.data);
      responseHandler.httpStatus = response.statusCode ?? defaultHttpStatusCode;
      return responseHandler;
    } on Exception catch (e, s) {
      Logger.write('@42 error is $e $s');
      rethrow;
    }
  }

  @override
  Future<ResponseHandler?> resetPassword(Map<String, dynamic> request) async {
    try {
      var response = await iBaseApiProvider.postMethod(
        ApiClient.resetPassword,
        request,
      );
      ResponseHandler? responseHandler = ResponseHandler.fromJson(response.data);
      responseHandler.httpStatus = response.statusCode ?? defaultHttpStatusCode;
      return responseHandler;
    } on Exception catch (e, s) {
      Logger.write('@42 error is $e $s');
      rethrow;
    }
  }
}
