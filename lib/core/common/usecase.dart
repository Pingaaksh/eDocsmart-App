import 'package:get/get.dart';
import 'package:skin_match/core/common/app_common_exports.dart';

class UseCase {
  String getMessage(Exception e) {
    if (e is CustomException) {
      return e.message;
    }
    return LocaleKeys.noInternetConnection.tr;
  }

  void l(dynamic s) {
    Logger.write(s);
  }
}
