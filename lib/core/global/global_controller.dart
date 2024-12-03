import 'package:get/get.dart';
import 'package:skin_match/core/common/app_common_exports.dart';

class GlobalGetXController extends GetxController {
  ProgressService get progressService => Get.find();

  SharedPreferenceService get sharedPreferenceService => Get.find();
}

mixin GlobalGetSharedPreference {
  SharedPreferenceService get sharedPreferenceService => Get.find();
}
