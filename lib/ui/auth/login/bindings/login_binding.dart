import 'package:get/get.dart';
import 'package:skin_match/ui/auth/login/export_login.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(Get.find()),
    );
  }
}
