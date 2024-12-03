import 'package:get/get.dart';
import 'package:skin_match/core/common/app_common_exports.dart';
import 'package:skin_match/core/widgets/app_common_back_button.dart';
import 'package:skin_match/ui/auth/reset_password/controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonBackButton(
        onBack: Get.back,
        title: LocaleKeys.resetPassword.tr,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
        ),
        child: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30.h),
                CommonTextField.password(
                  textEditController: controller.newPasswordController,
                  focusNode: controller.newPasswordFocusNode,
                  textInputType: TextInputType.visiblePassword,
                  labelText: LocaleKeys.newPassword.tr,
                  isLabelEnabled: true,
                  onValidate: (value) {
                    return controller.validatePassword(value ?? '');
                  },
                ),
                SizedBox(height: 20.h),
                CommonTextField.password(
                  textEditController: controller.confirmPasswordController,
                  focusNode: controller.confirmPasswordFocusNode,
                  textInputType: TextInputType.visiblePassword,
                  labelText: LocaleKeys.confirmPassword.tr,
                  isLabelEnabled: true,
                  onValidate: (value) {
                    return controller.confirmPasswordValidate(
                      controller.newPasswordController.text.trim(),
                      value ?? '',
                      LocaleKeys.confirmPassword.tr,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: CommonButton(
            onTap: () => controller.resetPassword(),
            text: LocaleKeys.update.tr,
          ),
        ),
      ),
    );
  }
}
