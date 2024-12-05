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
          padding: EdgeInsets.only(
            left: 30.w,
            right: 30.w,
            top: Get.height / 8,
          ),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.h),
                CommonTextRegular(
                  text: LocaleKeys.verifyYourIdentity,
                  size: 26.sp,
                  fontWeight: FontWeight.w700,
                  color: context.theme.colorScheme.primary,
                ),
                SizedBox(height: 10.h),
                CommonTextRegular(
                  text: LocaleKeys.enterTheCodeSentToYourEmailPhone,
                  size: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: context.theme.colorScheme.onTertiaryContainer,
                ),
                SizedBox(height: 40.h),
                PinCodeTextField(
                  controller: controller.otpController,
                  focusNode: controller.otpFocusNode,
                  appContext: context,
                  length: otpMaxLength,
                  onChanged: (value) {},
                  backgroundColor: Colors.transparent,
                  autoFocus: true,
                  autovalidateMode: AutovalidateMode.always,
                  errorTextMargin: EdgeInsets.symmetric(vertical: 50.h),
                  textStyle: context.theme.textTheme.labelMedium?.copyWith(
                    color: context.theme.colorScheme.primaryContainer,
                    fontSize: 18.sp,
                  ),
                  validator: (value) {
                    return controller.validateOTP(value ?? '');
                  },
                  animationCurve: Curves.easeOut,
                  keyboardType: TextInputType.number,
                  animationType: AnimationType.none,
                  cursorHeight: 20.h,
                  cursorColor: context.theme.primaryColor,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(100.r),
                    fieldHeight: 50.h,
                    fieldWidth: 50.w,
                    selectedColor: context.theme.colorScheme.primary,
                    activeColor: context.theme.colorScheme.primary,
                    disabledColor: context.theme.disabledColor,
                    activeFillColor:
                        context.theme.colorScheme.primary.withOpacity(0.10),
                    inactiveColor: context.theme.disabledColor,
                    inactiveFillColor: context.theme.colorScheme.primary,
                    selectedFillColor: context.theme.disabledColor,
                    borderWidth: 0.w,
                    fieldOuterPadding: EdgeInsets.zero,
                    errorBorderColor: context.theme.colorScheme.error,
                  ),
                ),
                 SizedBox(
                      height:  29.h ,),
                Obx(
                  () => controller.isResendEnable.isFalse? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonTextRegular(
                        text: LocaleKeys.resendOTPIN,
                        size: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: context.theme.colorScheme.secondaryContainer,
                      ),
                      SizedBox(width: 5.h,),
                       Align(
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
                                color: context.theme.colorScheme.secondary,
                                textAlign: TextAlign.center,
                                fontWeight: FontWeight.w600,
                              );
                            },
                          ),
                        ),

                    ],
                  ):GestureDetector(
                    onTap: () => controller.resendOTP(),
                    child: Align(
                      child: CommonTextRegular(
                        text: LocaleKeys.resendOTP.tr,
                        size: 16.sp,
                        color: context.theme.colorScheme.secondary,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 60.h),
                Align(
                  child: CommonButton(
                    width: 152.w,
                    onTap: () => controller.verifyOTP(),
                    text: LocaleKeys.verifyOTP.tr,
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
