import 'dart:async';
import 'package:skin_match/core/common/app_common_exports.dart';
import 'package:skin_match/core/global/global_controller.dart';

class IntroController extends GlobalGetXController with Validator {
  IntroController();
  PageController pageController = PageController();
  Timer? timer;
  int currentPage = 0;

@override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      if (currentPage < 2) {
        currentPage++;
      } else {
        currentPage = 0;
      }
      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }


  @override
  void onClose() {
    super.onClose();
    timer?.cancel();
    pageController.dispose();
  }
}
