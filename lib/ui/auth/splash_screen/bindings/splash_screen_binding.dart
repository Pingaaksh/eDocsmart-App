import 'package:get/get.dart';

import 'package:skin_match/ui/auth/splash_screen/controllers/splash_screen_controller.dart';

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashScreenController>(
      SplashScreenController.new,
    );
  }
}
