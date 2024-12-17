import 'package:get/get.dart';
import 'package:skin_match/core/routes/route_exports.dart';
import '../../models/remote/document_upload_model.dart';
import '../../ui/auth/otp_verify/bindings/otp_verify_binding.dart';
import '../../ui/auth/otp_verify/views/otp_verify_view.dart';
import '../../ui/auth/reset_password/bindings/reset_password_binding.dart';
import '../../ui/auth/reset_password/views/reset_password_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.INTRO_SCREEN,
      page: () => const IntroView(),
      binding: IntroBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
      transition: Transition.fadeIn,
    ),

    GetPage(
      name: _Paths.VERIFY_OTP,
      page: () => const OTPVerifyView(),
      binding: OTPVerifyBinding(),
      transition: Transition.fadeIn,
    ),


    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => const ResetPasswordView(),
      binding: ResetPasswordBinding(),
      transition: Transition.fadeIn,
    ),

    GetPage(
      name: _Paths.SCAN_DETAILS,
      page: () => ScanDetailsView(),
      binding: ScanDetailsBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
