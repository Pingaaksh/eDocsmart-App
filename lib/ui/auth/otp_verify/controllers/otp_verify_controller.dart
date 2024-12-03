import 'package:get/get.dart';
import 'package:skin_match/core/common/app_common_exports.dart';
import 'package:skin_match/core/global/global_controller.dart';
import 'package:skin_match/usecase/auth_usecase.dart';

class OTPVerifyController extends GlobalGetXController with Validator {
  RxBool isResendEnable = false.obs;
  RxString email = ''.obs;
  AuthUseCase authUseCase;

  OTPVerifyController(this.authUseCase);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();
  FocusNode otpFocusNode = FocusNode();

  @override
  void onReady() {
    email.value = Get.arguments ?? '';
    super.onReady();
  }

  void verifyOTP() async {
    String error = validateOTP(otpController.text) ?? '';
    if (error.isNotEmpty) {
      displaySnackBar(
        LocaleKeys.errorLabel.tr,
        error,
      );
      return;
    }
    try {
      Map<String, dynamic> request = {
        'email': email.value,
        'code': otpController.text.trim(),
      };
      progressService.showProgressDialog(true);
      var response = await authUseCase.verifyOTP(request);
      response.fold(
        (left) => left.getException(),
        (res) => Get.offNamed(Routes.RESET_PASSWORD, arguments: email.value),
      );
    } catch (e) {
      Logger.write('@register : Error ${e.toString()}');
    } finally {
      progressService.showProgressDialog(false);
    }
  }

  void sendOTP() {}

  Future<void> resendOTP() async {
    try {
      progressService.showProgressDialog(true);
      var response = await authUseCase.sendOTP(email.value);
      response.fold(
        (left) => left.getException(),
        (r) {
          otpController.clear();
          isResendEnable.value = false;
        },
      );
    } catch (e) {
      Logger.write('@register : Error ${e.toString()}');
    } finally {
      progressService.showProgressDialog(false);
    }
  }
}
