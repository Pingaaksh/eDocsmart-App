import 'package:get/get.dart';
import 'package:skin_match/core/common/app_common_exports.dart';
import 'package:skin_match/ui/auth/intro_screen/export_intro.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroView extends GetView<IntroController> {
  const IntroView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller.pageController,
                children: [
                  buildPage(
                    context,
                    image: PNGPath.onboardingFirst,
                    title: LocaleKeys.snapGo,
                    subtitle: LocaleKeys.snapYourInvoiceInstantly,
                    description: LocaleKeys.onboardingFirstDis,
                  ),
                  buildPage(
                    context,
                    image: PNGPath.onboardingSecond,
                    title: LocaleKeys.dataInAFlash,
                    subtitle: LocaleKeys.smartScanningPowerfulResults,
                    description: LocaleKeys.onboardingSecondDis,
                  ),
                  buildPage(
                    context,
                    image: PNGPath.onboardingThird,
                    title: LocaleKeys.easyOrganise,
                    subtitle: LocaleKeys.trackManageAndConquer,
                    description: LocaleKeys.onboardingThirdDis,
                  ),
                ],
              ),
            ),
            buildSmoothPageIndicator(controller,),
            CommonButton.secondary(onTap: () {

            },width: 152.w,height: 50.h,borderRadius: BorderRadius.circular(70.r),),
            SizedBox(height: 100.h,)
          ],
        ),
      ),
    );
  }
}
