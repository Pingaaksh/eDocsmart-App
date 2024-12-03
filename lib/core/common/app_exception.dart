import 'package:get/get.dart';
import 'package:skin_match/core/common/app_common_exports.dart';

abstract class AppException implements Exception {
  void onException({
    Function()? onButtonClick,
    String title,
    Function()? onDismissClick,
    String buttonText,
    String dismissButtonText,
  });
}

class CustomException extends AppException {
  String message;

  CustomException(this.message);

  @override
  void onException({
    Function()? onButtonClick,
    String title = 'Error',
    Function()? onDismissClick,
    String buttonText = 'Ok',
    String? dismissButtonText,
  }) {
    displaySnackBar(title, message, isSuccess: false);
  }
}

class NoInternetException extends AppException {
  String message;

  NoInternetException(this.message);

  @override
  void onException({
    Function()? onButtonClick,
    String? title,
    Function()? onDismissClick,
    String? buttonText,
    String? dismissButtonText,
  }) {
    showCommonDialog(message: LocaleKeys.noInternetConnection.tr);
  }
}

class InvalidTokenException extends AppException {
  String message;

  InvalidTokenException(this.message);

  @override
  void onException({
    Function()? onButtonClick,
    String? title,
    Function()? onDismissClick,
    String? buttonText,
    String? dismissButtonText,
  }) {
    sessionExpiredDialog();
  }
}

extension ExceptionMessage on Exception {
  String getMessage() {
    if (this is CustomException) {
      return (this as CustomException).message;
    } else if (this is InvalidTokenException) {
      return (this as InvalidTokenException).message;
    } else {
      return LocaleKeys.someThingWentWrong.tr;
    }
  }
}

extension ShowException on Exception {
  void getException() {
    try {
      if (this is CustomException) {
        displaySnackBar(
          LocaleKeys.errorLabel.tr,
          (this as CustomException).message,
          isSuccess: false,
        );
      } else if (this is InvalidTokenException) {
        displaySnackBar(
          LocaleKeys.errorLabel.tr,
          (this as InvalidTokenException).message,
          isSuccess: false,
        );
      } else {
        displaySnackBar(LocaleKeys.errorLabel.tr, LocaleKeys.someThingWentWrong.tr, isSuccess: false);
      }
    } catch (e) {
      Logger.write((e.toString()));
    }
  }
}
