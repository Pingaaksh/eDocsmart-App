import 'package:get/get.dart';
import 'package:skin_match/core/common/app_common_exports.dart';
import 'package:skin_match/core/global/global_controller.dart';
import 'package:skin_match/usecase/auth_usecase.dart';

class ForgotPasswordController extends GlobalGetXController with Validator {
  AuthUseCase authUseCase;

  ForgotPasswordController(this.authUseCase);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  FocusNode emailFN = FocusNode();

  Future<void> sendOTP() async {
    Get.toNamed(Routes.VERIFY_OTP, arguments: emailController.text.trim());
    if (formKey.currentState!.validate()) {
      try {
        progressService.showProgressDialog(true);
        var response = await authUseCase.sendOTP(emailController.text.trim());
        response.fold(
          (left) => left.getException(),
          (r) {
            Get.offNamed(Routes.VERIFY_OTP, arguments: emailController.text.trim());
          },
        );
      } catch (e) {
        Logger.write('@register : Error ${e.toString()}');
      } finally {
        progressService.showProgressDialog(false);
      }
    }
  }
}
