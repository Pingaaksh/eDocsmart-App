import 'package:fpdart/fpdart.dart';
import 'package:skin_match/core/common/app_common_exports.dart';
import 'package:skin_match/models/remote/token_model.dart';
import 'package:skin_match/models/remote/user_model.dart';

class AuthUseCase extends UseCase {
  final ApiProvider apiProvider;

  AuthUseCase(this.apiProvider);

  // Future<Either<Exception, TokenModel>> login(Map<String, dynamic> request) async {
  //   try {
  //     ResponseHandler? responseHandler = await apiProvider.login(request);
  //     Logger.write('------responseHandler----- 1 ${responseHandler!.message} ${responseHandler.isSuccess}');
  //     Logger.write('------responseHandler----- 1 ${responseHandler.result} ');
  //     if (responseHandler != null && responseHandler.isSuccess) {
  //       TokenModel? userModel = tryParseJsonObject<TokenMode?>(
  //         () => TokenMode.fromJson(responseHandler.result),
  //       );
  //       Either.right(responseHandler.message ?? '');
  //       return userModel != null
  //           ? Either.right(userModel)
  //           : Either.left(CustomException(responseHandler.message ?? ''));
  //     } else {
  //       return Either.left(CustomException(responseHandler.message ?? ''));
  //     }
  //   } on Exception catch (e) {
  //     return Either.left(e);
  //   }
  // }

  Future<Either<Exception, TokenModel>> login(
    Map<String, dynamic> request,
  ) async {
    try {
      ResponseHandler? responseHandler = await apiProvider.login(request);
      if (responseHandler != null && responseHandler.isSuccess) {
        TokenModel? tokenModel = tryParseJsonObject<TokenModel?>(
          () => TokenModel.fromJson(responseHandler.result),
        );

        if (tokenModel != null) {
          if (tokenModel.isValid()) {
            Logger.write('tokenMode parsed and validated successfully.');
            return Either.right(tokenModel);
          } else {
            return Either.left(
              CustomException('Invalid tokenMode structure or missing fields.'),
            );
          }
        } else {
          return Either.left(
            CustomException(
              responseHandler.message ?? 'Failed to parse user data.',
            ),
          );
        }
      } else {
        return Either.left(
          CustomException(
            responseHandler?.message ?? 'Unknown error occurred.',
          ),
        );
      }
    } on Exception catch (e) {
      return Either.left(e);
    }
  }

  Future<Either<Exception, UserModel>?> signup(
    Map<String, dynamic> request,
  ) async {
    try {
      ResponseHandler? responseHandler = await apiProvider.signUp(request);
      if (responseHandler != null && responseHandler.isSuccess) {
        UserModel? userModel = tryParseJsonObject<UserModel?>(
          () => UserModel.fromJson(responseHandler.result),
        );
        return userModel != null
            ? Either.right(userModel)
            : Either.left(CustomException(responseHandler.message ?? ''));
      } else {
        Logger.write('-1-1-1-1-1-1-1-1 ${responseHandler!.message}');
        return Either.left(CustomException(responseHandler.message ?? ''));
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

  Future<Either<Exception, String>> verifyOTP(
    Map<String, dynamic> request,
  ) async {
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

  Future<Either<Exception, String>> resetPassword(
    Map<String, dynamic> request,
  ) async {
    try {
      ResponseHandler? responseHandler =
          await apiProvider.resetPassword(request);
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
