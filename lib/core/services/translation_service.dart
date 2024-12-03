import 'package:get/get.dart';
import 'package:skin_match/core/common/app_common_exports.dart';

class TranslationService extends Translations {
  static Locale get locale => Get.deviceLocale!;
  static const english = Locale('en', 'US');
  static const arabic = Locale('ar', 'DZ');

  static Locale get currentLocale => english;

  @override
  Map<String, Map<String, String>> get keys => AppTranslation.translations;
}
