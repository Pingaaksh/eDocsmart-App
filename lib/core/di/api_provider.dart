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


      ResponseHandler? responseHandler = ResponseHandler.fromJson(response.data);
      responseHandler.httpStatus = response.statusCode ?? defaultHttpStatusCode;
      return responseHandler;
    } on Exception catch (e, s) {
      Logger.write('@42 error is $e $s');
      rethrow;
    }
  }

  Future<ResponseHandler?> signUp(Map<String, dynamic> request) async {
    try {
      var response = await iBaseApiProvider.postMethod(
        ApiClient.register,
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
