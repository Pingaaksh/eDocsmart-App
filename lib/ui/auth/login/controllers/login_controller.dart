import 'package:skin_match/core/common/app_common_exports.dart';
import 'package:skin_match/core/global/global_controller.dart';
import 'package:skin_match/ui/dashboard/view/dashboard_view.dart';
import 'package:skin_match/usecase/auth_usecase.dart';
import 'package:get/get.dart';

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
      Map<String, dynamic> request = {
        'email': emailController.text,
        'password': passwordController.text,
      };
      try {
        progressService.showProgressDialog(true);
        var response = await authUseCase.login(request);
        response.fold((left) => left.getException(), (tokenModel) {
          sharedPreferenceService.setUser(tokenModel);
          Get.to(() => const DashboardView());
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
