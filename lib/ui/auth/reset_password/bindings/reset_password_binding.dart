import 'package:get/get.dart';
import 'package:skin_match/usecase/auth_usecase.dart';

import '../controllers/reset_password_controller.dart';

class ResetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResetPasswordController>(
      () => ResetPasswordController(Get.find<AuthUseCase>()),
    );
  }
}
