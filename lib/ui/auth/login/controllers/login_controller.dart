import 'package:skin_match/core/common/app_common_exports.dart';
import 'package:skin_match/core/di/firebase_messaging_manager.dart';
import 'package:skin_match/core/global/global_controller.dart';
import 'package:skin_match/usecase/auth_usecase.dart';

class LoginController extends GlobalGetXController with Validator {
  LoginController(this.authUseCase);

  AuthUseCase authUseCase;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailFN = FocusNode();
  FocusNode passwordFN = FocusNode();

  Future<void> signIn() async {
    if (formKey.currentState!.validate()) {
      String deviceToken = await FirebaseMessagingManager.instance.getToken() ?? '';
      Map<String, dynamic> request = {
        'email': emailController.text.trim(),
        'password': passwordController.text.trim(),
        'device_type': Platform.isAndroid ? android : ios,
        'device_id': deviceId,
        'device_token': deviceToken,
      };
      try {
        progressService.showProgressDialog(true);
        var response = await authUseCase.login(request);
        response.fold((left) => left.getException(), (userModel) {
          sharedPreferenceService.setUser(userModel);
        });
      } catch (e) {
        Logger.write('@Login : Error : ${e.toString()}');
      } finally {
        progressService.showProgressDialog(false);
      }
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
