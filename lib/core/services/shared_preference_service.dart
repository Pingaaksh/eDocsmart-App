import 'package:skin_match/core/common/app_common_exports.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skin_match/models/remote/user_model.dart';

enum UserType { admin, driver, invalidUser }

class SharedPreferenceService extends GetxService {
  SharedPreferences? _pref;
  final String _themeMode = 'themeMode';
  final String _token = 'token';
  final String _userData = 'user_data';

  RxString imageProfileUrl = ''.obs;
  RxString name = ''.obs;
  RxString email = ''.obs;
  RxInt cartCount = 0.obs;
  RxBool isFastFoxSubscription = false.obs;
  RxString fastFoxExpiredDate = ''.obs;

  Future<void> clearData() async {
    await _pref?.clear();
  }

  Future<SharedPreferenceService> init() async {
    _pref = await SharedPreferences.getInstance();
    // _getUserDetails();
    return this;
  }

  Future<ThemeMode> getThemeMode() async {
    String theme = _pref?.getString(_themeMode) ?? '';
    if (theme.isNotEmpty) {
      return ThemeMode.values.firstWhere((element) => element.name == theme);
    }
    return ThemeMode.system;
  }

  Future<void> setThemeMode(ThemeMode theme) async {
    _pref!.setString(_themeMode, theme.name);
  }

  void setToken(String token) {
    _pref!.setString(_token, token);
  }

  void setUser(UserModel user) {
    setToken(user.token ?? '');
    _pref!.setString(_userData, jsonEncode(user));
    _getUserDetails();
  }

  Future<UserModel> getUser() async {
    String? userData = _pref?.getString(_userData);
    if (userData != null) {
      return UserModel.fromJson(jsonDecode(userData));
    }
    return UserModel();
  }

  Future<String?> getToken() async {
    String? token = _pref?.getString(_token);
    return token;
  }

  void _getUserDetails() async {
    UserModel? model = await getUser();
    name.value = model.name ?? '';
    email.value = model.email ?? '';
  }
//
// void updateUser(String? name, String? avatarUrl) async {
//   UserModel? model = await getUser();
//   model?.name = name;
//   model?.avatarUrl = avatarUrl;
//   setUser(model);
// }
}
