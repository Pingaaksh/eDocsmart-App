import 'package:get/get.dart';
import 'package:skin_match/core/common/app_common_exports.dart';
import 'package:skin_match/ui/auth/intro_screen/export_intro.dart';

class IntroView extends GetView<IntroController> {
  const IntroView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: SizedBox(
                height: Get.height * 0.8,
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
            ),
            buildSmoothPageIndicator(
              controller,
            ),
            SizedBox(height:58.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CommonButton.secondary(
                  onTap: () {},
                  width: 152.w,
                  text: LocaleKeys.register,
                  outLineColor: LightThemeColors.secondaryColor,
                ),
                CommonButton(
                  onTap: () {},
                  width: 152.w,
                  text: LocaleKeys.login,
                ),

              ],
            ),
           SizedBox(height:48.h),
          ],
        ),
      ),
    );
  }
}
