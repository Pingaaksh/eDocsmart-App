import 'package:get/get.dart';
import 'package:skin_match/core/common/app_common_exports.dart';
import 'package:skin_match/core/widgets/app_common_back_button.dart';
import 'package:skin_match/ui/auth/forgot_password/export_forgot_password.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CommonBackButton(onBack: Get.back),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(
            left: 30.w,right: 30.w,
            top: Get.width/3
          ),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.h),
                CommonTextRegular(
                  text: LocaleKeys.forgotPassword,
                  size: 26.sp,
                  fontWeight: FontWeight.w700,
                  color: LightThemeColors.primaryColor,
                ),
                SizedBox(height: 10.h),
                CommonTextRegular(
                  text: LocaleKeys.enterYourEmailToReceiveALink,
                  size: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: LightThemeColors.textDescription,
                ),
                SizedBox(height: 50.h),
                CommonTextField(
                  isFilled: false,
                  textEditController: controller.emailController,
                  focusNode: controller.emailFN,
                  textInputType: TextInputType.emailAddress,
                  labelText: LocaleKeys.email.tr,
                  onValidate: (value) {
                    return controller.validateEmail(value ?? '');
                  },
                ),
                SizedBox(height: 50.h),
                Align(
                  child: CommonButton(
                    width: 152.w,
                    onTap: () => controller.sendOTP(),
                    text: LocaleKeys.sendOTP.tr,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
