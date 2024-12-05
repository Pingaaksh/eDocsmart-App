import 'package:get/get.dart';
import 'package:skin_match/core/common/app_common_exports.dart';
import 'package:skin_match/ui/auth/sign_up_screen/views/export_signup.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 38.w),
            child: SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CommonTextRegular(
                        text: LocaleKeys.getStartedNow,
                        size: 26.sp,
                        fontWeight: FontWeight.w700,
                        color: context.theme.colorScheme.primary,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CommonTextRegular(
                        text: LocaleKeys.signUpNowToUnlock,
                        size: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: context.theme.colorScheme.onTertiaryContainer,
                      ),
                    ),
                    SizedBox(height: 30.h),
                    CommonTextField(
                      isFilled: false,
                      textEditController: controller.firstNameController,
                      focusNode: controller.firstNameFN,
                      textInputType: TextInputType.name,
                      labelText: LocaleKeys.firstName.tr,
                    ),
                    SizedBox(height: 15.h),
                    CommonTextField(
                      isFilled: false,
                      textEditController: controller.lastNameController,
                      focusNode: controller.lastNameFN,
                      textInputType: TextInputType.name,
                      labelText: LocaleKeys.lastName.tr,
                    ),
                    SizedBox(height: 15.h),
                    CommonTextField(
                      isFilled: false,
                      textEditController: controller.userNameController,
                      focusNode: controller.userNameFN,
                      textInputType: TextInputType.name,
                      labelText: LocaleKeys.username.tr,
                      onValidate: (value) {
                        return controller.emptyValidate(
                            value ?? '', LocaleKeys.username.tr,);
                      },
                    ),
                    SizedBox(height: 15.h),
                    CommonTextField(
                      isFilled: false,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      textEditController: controller.emailAddressController,
                      focusNode: controller.emailAddressFN,
                      textInputType: TextInputType.emailAddress,
                      labelText: LocaleKeys.emailAddress.tr,
                      onValidate: (value) {
                        return controller.validateEmail(value ?? '');
                      },
                    ),
                    SizedBox(height: 15.h),
                    CommonTextField(
                      isFilled: false,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      textEditController: controller.mobileNumberController,
                      focusNode: controller.mobileNumberFN,
                      textInputType: TextInputType.phone,
                      labelText: LocaleKeys.mobileNumber.tr,
                      onValidate: (value) {
                        return controller.validateMobile(value ?? '');
                      },
                    ),
                    SizedBox(height: 15.h),
                    CommonTextField.password(
                      isFilled: false,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      textEditController: controller.passwordController,
                      focusNode: controller.passwordFN,
                      textInputType: TextInputType.name,
                      labelText: LocaleKeys.password.tr,
                      onValidate: (value) {
                        return controller.validatePassword(value);
                      },
                    ),
                    SizedBox(height: 15.h),
                    CommonTextField.password(
                      isFilled: false,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      textEditController: controller.confirmPasswordController,
                      focusNode: controller.confirmPasswordFN,
                      textInputType: TextInputType.name,
                      labelText: '${LocaleKeys.confirmPassword.tr}    e.g   Abcd@1',
                      onValidate: (value) {
                        return controller.confirmPasswordValidate(
                          controller.passwordController.text,
                          value ?? '',
                          LocaleKeys.confirmPassword.tr,
                        );
                      },
                    ),
                    SizedBox(height: 20.h),
                    CommonButton(
                      onTap: () {
                        controller.signUp();
                      },
                      width: 152.w,
                      text: LocaleKeys.register,
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CommonTextRegular(
                          text: LocaleKeys.alreadyHaveAnAccount,
                          size: 12.sp,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w500,
                          color: context.theme.colorScheme.secondaryContainer,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        GestureDetector(
                          onTap: () => Get.offAllNamed(Routes.LOGIN),
                          child: CommonTextRegular(
                            text: LocaleKeys.signIn,
                            size: 12.sp,
                            textAlign: TextAlign.center,
                            fontWeight: FontWeight.w700,
                            color: context.theme.colorScheme.secondary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
