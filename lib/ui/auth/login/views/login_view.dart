import 'package:get/get.dart';
import 'package:skin_match/core/common/app_common_exports.dart';
import 'package:skin_match/ui/auth/login/export_login.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

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
                      height: 100.h,
                    ),
                    Center(
                      child: SvgPicture.asset(
                        SVGPath.logo,
                        fit: BoxFit.fitWidth,
                        width: 100.72.w,
                        height: 100.00.h,
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CommonTextRegular(
                        text: LocaleKeys.welcomeBack,
                        size: 26.sp,
                        fontWeight: FontWeight.w700,
                        color: LightThemeColors.primaryColor,
                      ),
                    ),
                    SizedBox(height: 17.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CommonTextRegular(
                        text: LocaleKeys.enterYourCredentials,
                        size: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: LightThemeColors.textDescription,
                      ),
                    ),
                    SizedBox(height: 50.h),
                    CommonTextField(
                      isFilled: false,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      textEditController: controller.emailController,
                      focusNode: controller.emailFN,
                      textInputType: TextInputType.emailAddress,
                      labelText: LocaleKeys.emailUsername.tr,
                      onValidate: (value) {
                        return controller.validateEmail(value ?? '');
                      },
                    ),
                    const SizedBox(height: 20),
                    CommonTextField.password(
                      isFilled: false,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      textEditController: controller.passwordController,
                      focusNode: controller.passwordFN,
                      textInputType: TextInputType.name,
                      labelText: LocaleKeys.password.tr,
                      onValidate: (value) {
                        return controller.validatePassword(value ?? '');
                      },
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.FORGOT_PASSWORD);
                        },
                        child: CommonTextRegular(
                          text: LocaleKeys.forgotPassword,
                          size: 14.sp,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w500,
                          color: LightThemeColors.textSecondary,
                          fontFamilyType: FontFamilyType.poppins,
                        ),
                      ),
                    ),
                    SizedBox(height: 48.h),
                    CommonButton(
                      onTap: () {
                        controller.signIn();
                      },
                      width: 152.w,
                      text: LocaleKeys.login,
                    ),
                    SizedBox(
                      height: 100.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CommonTextRegular(
                          text: LocaleKeys.dontHaveAnAccount,
                          size: 12.sp,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w500,
                          color: LightThemeColors.textSecondary,
                          fontFamilyType: FontFamilyType.poppins,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        GestureDetector(
                          onTap: () => Get.offAllNamed(Routes.SIGNUP),
                          child: CommonTextRegular(
                            text: LocaleKeys.signUp,
                            size: 12.sp,
                            textAlign: TextAlign.center,
                            fontWeight: FontWeight.w700,
                            color: LightThemeColors.secondaryColor,
                            fontFamilyType: FontFamilyType.poppins,
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
