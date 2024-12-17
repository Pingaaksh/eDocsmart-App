import 'package:get/get.dart';
import 'package:skin_match/core/common/app_common_exports.dart';
import 'package:skin_match/core/global/global_controller.dart';

class ScanDetailsController extends GlobalGetXController with Validator {
  RxInt selectedIndex = 0.obs;
  RxMap tableData = {}.obs;
  RxMap textData = {}.obs;

  void parseApiResponse(Map<String, dynamic> response) {
    Logger.write("--- data type --- ${response['text_data'].runtimeType}   ${response['table_data'].runtimeType}");

    textData.value = response['text_data'] ?? {};
    Logger.write("--- Text Data --- ${textData}");
    Logger.write("--- Text Data --- ${response['table_data']}");

  }
}
