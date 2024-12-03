import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:skin_match/core/common/app_common_exports.dart';
import 'package:skin_match/core/widgets/app_common_back_button.dart';

import '../controllers/otp_verify_controller.dart';

class OTPVerifyView extends GetView<OTPVerifyController> {
  const OTPVerifyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonBackButton(onBack: Get.back),
      extendBodyBehindAppBar: true,
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
                  SvgPicture.asset(SVGPath.otpVerifyIcon),
                  SizedBox(height: 30.h),
                  CommonTextRegular(
                    text: LocaleKeys.otpVerification.tr,
                    size: 26.sp,
                    fontFamilyType: FontFamilyType.elMessiri,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(height: 10.h),
                  CommonTextRegular(
                    text: LocaleKeys.otpVerificationDesc.tr,
                    size: 16.sp,
                    lineHeight: 1.5,
                    color: context.theme.colorScheme.primaryContainer.withOpacity(0.70),
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w500,
                  ),
                  Obx(
                    () => controller.email.isNotEmpty
                        ? CommonTextRegular(
                            text: controller.email.value,
                            size: 18.sp,
                            lineHeight: 1.5,
                            color: context.theme.colorScheme.primaryContainer.withOpacity(0.70),
                            textAlign: TextAlign.center,
                            fontWeight: FontWeight.w700,
                          )
                        : const Offstage(),
                  ),
                  SizedBox(height: 24.h),
                  PinCodeTextField(
                    controller: controller.otpController,
                    focusNode: controller.otpFocusNode,
                    appContext: context,
                    length: otpMaxLength,
                    onChanged: (value) {},
                    backgroundColor: Colors.transparent,
                    autoFocus: true,
                    enableActiveFill: true,
                    autovalidateMode: AutovalidateMode.always,
                    errorTextMargin: EdgeInsets.symmetric(vertical: 50.h),
                    textStyle: context.theme.textTheme.labelMedium?.copyWith(
                      color: context.theme.colorScheme.primaryContainer,
                      fontSize: 26.sp,
                    ),
                    validator: (value) {
                      return controller.validateOTP(value ?? '');
                    },
                    animationCurve: Curves.easeOut,
                    keyboardType: TextInputType.number,
                    animationType: AnimationType.none,
                    cursorHeight: 30.h,
                    cursorColor: context.theme.primaryColor,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(100.r),
                      fieldHeight: 80.w,
                      fieldWidth: 80.w,
                      selectedColor: context.theme.colorScheme.secondary,
                      activeColor: context.theme.colorScheme.primary,
                      disabledColor: context.theme.colorScheme.secondary,
                      activeFillColor: context.theme.colorScheme.primary.withOpacity(0.10),
                      inactiveColor: context.theme.colorScheme.secondary,
                      inactiveFillColor: context.theme.colorScheme.secondary,
                      selectedFillColor: context.theme.colorScheme.secondary,
                      borderWidth: 0.w,
                      fieldOuterPadding: EdgeInsets.zero,
                      errorBorderColor: context.theme.colorScheme.error,
                    ),
                  ),
                  Obx(
                    () => SizedBox(height: controller.isResendEnable.isFalse ? 20.h : 0),
                  ),
                  Obx(
                    () => Visibility(
                      visible: controller.isResendEnable.isFalse,
                      child: TweenAnimationBuilder<Duration>(
                        duration: const Duration(minutes: 1),
                        tween: Tween(
                          begin: const Duration(minutes: 1),
                          end: const Duration(seconds: 1),
                        ),
                        onEnd: () {
                          controller.isResendEnable.value = true;
                        },
                        builder: (
                          BuildContext context,
                          Duration value,
                          Widget? child,
                        ) {
                          var seconds = value.inSeconds % 60;
                          NumberFormat formatter = NumberFormat('00');
                          return CommonTextRegular(
                            text: '00:${formatter.format(seconds)}',
                            size: 16.sp,
                            color: context.theme.colorScheme.primary,
                            textAlign: TextAlign.center,
                            fontWeight: FontWeight.w600,
                          );
                        },
                      ),
                    ),
                  ),
                  Obx(
                    () => SizedBox(height: controller.isResendEnable.isTrue ? 20.h : 0),
                  ),
                  Obx(
                    () => controller.isResendEnable.isTrue
                        ? GestureDetector(
                            onTap: () => controller.resendOTP(),
                            child: CommonTextRegular(
                              text: LocaleKeys.resendOTP.tr,
                              size: 16.sp,
                              color: context.theme.colorScheme.primary,
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        : const Offstage(),
                  ),
                  SizedBox(height: 40.h),
                  CommonButton(
                    onTap: () => controller.verifyOTP(),
                    text: LocaleKeys.verify.tr,
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
