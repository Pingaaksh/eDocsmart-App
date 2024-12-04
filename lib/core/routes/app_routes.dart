part of 'app_pages.dart';

// ignore_for_file: constant_identifier_names
abstract class Routes {
  Routes._();

  static const INIT = _Paths.SPLASH_SCREEN;
  static const INTRO_SCREEN = _Paths.INTRO_SCREEN;
  static const LOGIN = _Paths.LOGIN;
  static const SIGNUP = _Paths.SIGNUP;

  static const STEP1 = _Paths.STEP1;
  static const STEP2 = _Paths.STEP2;
  static const VERIFY_OTP = _Paths.VERIFY_OTP;
  static const FORGOT_PASSWORD = _Paths.FORGOT_PASSWORD;
  static const RESET_PASSWORD = _Paths.RESET_PASSWORD;
}

abstract class _Paths {
  _Paths._();

  static const SPLASH_SCREEN = '/splash-screen';
  static const INTRO_SCREEN = '/intro-screen';
  static const LOGIN = '/login';
  static const SIGNUP = '/signup';

  static const STEP1 = '/step1';
  static const STEP2 = '/step2';
  static const VERIFY_OTP = '/verify-otp';

  static const RESET_PASSWORD = '/reset-password';
  static const FORGOT_PASSWORD = '/forgot-password';
}
