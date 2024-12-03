import 'package:get/get.dart';
import 'package:skin_match/usecase/auth_usecase.dart';

import '../controllers/otp_verify_controller.dart';

class OTPVerifyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OTPVerifyController>(
      () => OTPVerifyController(Get.find<AuthUseCase>()),
    );
  }
}
