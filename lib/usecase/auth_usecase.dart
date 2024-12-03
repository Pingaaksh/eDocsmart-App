import 'package:fpdart/fpdart.dart';
import 'package:skin_match/core/common/app_common_exports.dart';
import 'package:skin_match/models/remote/user_model.dart';

class AuthUseCase extends UseCase {
  final ApiProvider apiProvider;

  AuthUseCase(this.apiProvider);

  Future<Either<Exception, UserModel>> login(Map<String, dynamic> request) async {
    try {
      ResponseHandler? responseHandler = await apiProvider.login(request);
      if (responseHandler != null && responseHandler.isSuccess) {
        UserModel? userModel = tryParseJsonObject<UserModel?>(
          () => UserModel.fromJson(responseHandler.result),
        );
        return userModel != null
            ? Either.right(userModel)
            : Either.left(CustomException(responseHandler.message ?? ''));
      } else {
        return Either.left(CustomException(responseHandler?.message ?? ''));
      }
    } on Exception catch (e) {
      return Either.left(e);
    }
  }

  Future<Either<Exception, String>> sendOTP(String email) async {
    try {
      ResponseHandler? responseHandler = await apiProvider.sendOTP(email);
      if (responseHandler != null && responseHandler.isSuccess) {
        return Either.right(responseHandler.message ?? '');
      } else {
        return Either.left(CustomException(responseHandler?.message ?? ''));
      }
    } on Exception catch (e) {
      return Either.left(e);
    }
  }

  Future<Either<Exception, String>> verifyOTP(Map<String, dynamic> request) async {
    try {
      ResponseHandler? responseHandler = await apiProvider.verifyOTP(request);
      if (responseHandler != null && responseHandler.isSuccess) {
        return Either.right(responseHandler.message ?? '');
      } else {
        return Either.left(CustomException(responseHandler?.message ?? ''));
      }
    } on Exception catch (e) {
      return Either.left(e);
    }
  }
  Future<Either<Exception, String>> resetPassword(Map<String, dynamic> request) async {
    try {
      ResponseHandler? responseHandler = await apiProvider.resetPassword(request);
      if (responseHandler != null && responseHandler.isSuccess) {
        return Either.right(responseHandler.message ?? '');
      } else {
        return Either.left(CustomException(responseHandler?.message ?? ''));
      }
    } on Exception catch (e) {
      return Either.left(e);
    }
  }
}
