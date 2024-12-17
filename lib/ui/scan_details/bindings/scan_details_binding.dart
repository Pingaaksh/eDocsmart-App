import 'package:get/get.dart';

import 'package:skin_match/ui/scan_details/controllers/scan_details_controller.dart';

class ScanDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScanDetailsController>(() => ScanDetailsController(),
    );
  }
}
