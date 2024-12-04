import 'package:skin_match/core/common/app_common_exports.dart';
import 'package:skin_match/core/global/global_controller.dart';
import 'package:skin_match/usecase/auth_usecase.dart';

class SignupController extends GlobalGetXController with Validator {
  SignupController(this.authUseCase);

  AuthUseCase authUseCase;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  FocusNode firstNameFN = FocusNode();
  FocusNode lastNameFN = FocusNode();
  FocusNode userNameFN = FocusNode();
  FocusNode emailAddressFN = FocusNode();
  FocusNode mobileNumberFN = FocusNode();
  FocusNode passwordFN = FocusNode();
  FocusNode confirmPasswordFN = FocusNode();

  Future<void> signIn() async {
    if (formKey.currentState!.validate()) {
    //  String deviceToken = await FirebaseMessagingManager.instance.getToken() ?? '';
      Map<String, dynamic> request = {
        // 'email': emailController.text.trim(),
        // 'password': passwordController.text.trim(),
        // 'device_type': Platform.isAndroid ? android : ios,
        // 'device_id': deviceId,
        // 'device_token': deviceToken,
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
    // emailController.dispose();
    // passwordController.dispose();
    super.dispose();
  }
}
