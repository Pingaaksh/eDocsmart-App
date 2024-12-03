import 'package:get/get.dart';
import 'package:skin_match/ui/auth/intro_screen/export_intro.dart';

class IntroBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IntroController>(
      IntroController.new,
    );
  }
}
