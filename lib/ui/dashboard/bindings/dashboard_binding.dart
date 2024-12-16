import 'package:get/get.dart';
import 'package:skin_match/ui/auth/sign_up_screen/views/export_signup.dart';
import 'package:skin_match/ui/dashboard/controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
          () => DashboardController(Get.find()),
    );
  }
}
