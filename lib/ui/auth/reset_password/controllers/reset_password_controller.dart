import 'package:get/get.dart';
import 'package:skin_match/core/common/app_common_exports.dart';
import 'package:skin_match/core/global/global_controller.dart';
import 'package:skin_match/usecase/auth_usecase.dart';

class ResetPasswordController extends GlobalGetXController with Validator {
  RxBool isResendEnable = false.obs;
  RxString email = ''.obs;
  AuthUseCase authUseCase;

  ResetPasswordController(this.authUseCase);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  FocusNode newPasswordFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();

  @override
  void onReady() {
    email.value = Get.arguments ?? '';
    super.onReady();
  }

  Future<void> resetPassword() async {
    if (formKey.currentState!.validate()) {
      try {
        Map<String, dynamic> request = {
          'email': email.value,
          'new_password': newPasswordController.text.trim(),
        };
        progressService.showProgressDialog(true);
        var response = await authUseCase.resetPassword(request);
        response.fold(
          (left) => left.getException(),
          (r) {
            showCommonDialog(
              title: LocaleKeys.passwordChanged.tr,
              message: LocaleKeys.passwordChangedDesc.tr,
              isDialog: true,
              lottieAnim: '',
              positiveText: LocaleKeys.loginAgain.tr,
              onTap: Get.back,
            );
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
