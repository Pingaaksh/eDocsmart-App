class ApiClient {
  static const bool _isDevelopmentMode = true;
  static const String _url = _isDevelopmentMode
      ? 'https://sknmatch.concettoprojects.com/api/'
      : 'https://concetto.bargainfox.com/api/';

  static const Map<String, String> applicationJsonHeader = {
    'Content-Type': 'application/json',
  };

  static String baseUrl = _url;
  final String jsonHeaderName = 'Content-Type';
  static String jsonHeaderValue = 'application/json; charset=UTF-8';
  static int timeoutSec = 200;
  static int receiveTimeoutSec = 200;
  final int successResponse = 200;

  static const String login = 'login';
  static const String forgotPassword = 'forgot-password';
  static const String verifyOTP = 'verify-code';
  static const String resetPassword = 'reset-password';
}
