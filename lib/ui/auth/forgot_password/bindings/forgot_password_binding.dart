import 'package:get/get.dart';
import 'package:skin_match/ui/auth/forgot_password/export_forgot_password.dart';
import 'package:skin_match/usecase/auth_usecase.dart';

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordController>(
      () => ForgotPasswordController(Get.find<AuthUseCase>()),
    );
  }
}
