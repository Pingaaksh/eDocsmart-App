import 'package:get/get.dart';
import 'package:skin_match/ui/auth/splash_screen/controllers/splash_screen_controller.dart';
import 'package:skin_match/core/common/app_common_exports.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  final controller = Get.find<SplashScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: Container(
        height: Get.height,
        decoration: const BoxDecoration(
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: SvgPicture.asset(
                    SVGPath.logo,
                    fit: BoxFit.fitWidth,
                    width: 182.72.w,
                    height: 241.00.h,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
