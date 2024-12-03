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
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
          ),
          child: Form(
            key: controller.formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SvgPicture.asset(SVGPath.forgotPasswordIcon),
                  SizedBox(height: 30.h),
                  CommonTextRegular(
                    text: LocaleKeys.forgotPassword.tr,
                    size: 26.sp,
                    fontFamilyType: FontFamilyType.elMessiri,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(height: 10.h),
                  CommonTextRegular(
                    text: LocaleKeys.forgotDescription.tr,
                    size: 16.sp,
                    lineHeight: 1.5,
                    color: context.theme.colorScheme.primaryContainer.withOpacity(0.70),
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(height: 24.h),
                  CommonTextField(
                    textEditController: controller.emailController,
                    focusNode: controller.emailFN,
                    textInputType: TextInputType.emailAddress,
                    labelText: LocaleKeys.email.tr,
                    onValidate: (value) {
                      return controller.validateEmail(value ?? '');
                    },
                  ),
                  SizedBox(height: 40.h),
                  CommonButton(
                    onTap: () => controller.sendOTP(),
                    text: LocaleKeys.sendOTP.tr,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
