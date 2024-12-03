import 'package:get/get.dart';
import 'package:skin_match/core/common/app_common_exports.dart';
import 'package:skin_match/ui/auth/login/export_login.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
        height: Get.height,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Image.asset(
                PNGPath.loginBottom,
                width: Get.width,
              ),
            ),
            Positioned.fill(
              child: SafeArea(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                  child: Form(
                    key: controller.formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            SVGPath.logo,
                            width: 73.w,
                            height: 93.34.h,
                          ),
                          SizedBox(height: 18.h),
                          CommonTextRegular(
                            text: LocaleKeys.welcomeBack,
                            size: 26.sp,
                            fontFamilyType: FontFamilyType.elMessiri,
                            fontWeight: FontWeight.w500,
                          ),
                          CommonTextRegular(
                            text: 'SknMatch',
                            size: 40.sp,
                            fontFamilyType: FontFamilyType.elMessiri,
                            fontWeight: FontWeight.w700,
                          ),
                          SizedBox(height: 30.h),
                          CommonTextRegular(
                            text: LocaleKeys.loginDesc.tr,
                            size: 16.sp,
                            textAlign: TextAlign.center,
                            color: context.theme.colorScheme.primaryContainer
                                .withOpacity(0.80),
                          ),
                          SizedBox(height: 20.h),
                          CommonTextField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            textEditController: controller.emailController,
                            focusNode: controller.emailFN,
                            textInputType: TextInputType.emailAddress,
                            labelText: LocaleKeys.email.tr,
                            onValidate: (value) {
                              return controller.validateEmail(value ?? '');
                            },
                          ),
                          SizedBox(height: 20.h),
                          CommonTextField.password(
                            textEditController: controller.passwordController,
                            focusNode: controller.passwordFN,
                            textInputType: TextInputType.visiblePassword,
                            labelText: LocaleKeys.password.tr,
                            textInputAction: TextInputAction.done,
                            prefixIcon: Padding(
                              padding: EdgeInsets.symmetric(vertical: 14.h),
                              child: SvgPicture.asset(
                                SVGPath.passwordIcon,
                              ),
                            ),
                            onValidate: (value) {
                              return controller.validatePassword(value ?? '');
                            },
                          ),
                          SizedBox(height: 20.h),
                          GestureDetector(
                            onTap: () => Get.toNamed(Routes.FORGOT_PASSWORD),
                            behavior: HitTestBehavior.opaque,
                            child: CommonTextRegular(
                              text: LocaleKeys.forgotPassword.tr,
                              fontWeight: FontWeight.w600,
                              color: context.theme.colorScheme.primary,
                              size: 16.sp,
                            ),
                          ),
                          SizedBox(height: 30.h),
                          CommonButton(
                            onTap: () => controller.signIn(),
                            text: LocaleKeys.login.tr,
                          ),
                          SizedBox(height: 20.h),
                          GestureDetector(
                            onTap: () => Get.toNamed(Routes.STEP1),
                            behavior: HitTestBehavior.opaque,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CommonTextRegular(
                                  text: LocaleKeys.dontHaveAnAccount.tr,
                                  color: context
                                      .theme.colorScheme.primaryContainer
                                      .withOpacity(0.70),
                                  size: 15.sp,
                                ),
                                SizedBox(width: 5.w),
                                CommonTextRegular(
                                  text: LocaleKeys.signUp.tr,
                                  color: context
                                      .theme.colorScheme.primaryContainer,
                                  size: 15.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
