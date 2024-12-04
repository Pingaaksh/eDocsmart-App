import 'package:get/get.dart';
import 'package:skin_match/ui/auth/sign_up_screen/views/export_signup.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(
          () => SignupController(Get.find()),
    );
  }
}
