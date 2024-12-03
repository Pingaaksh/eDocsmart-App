import 'package:skin_match/core/routes/route_exports.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/common/app_common_exports.dart';

Widget buildPage(
  BuildContext context, {
  required String image,
  required String title,
  required String subtitle,
  required String description,
}) {
  return Center(
    child: Padding(
      padding:  EdgeInsets.symmetric(horizontal: 50.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              image,
              width: 248.15.h,
              height: 242.36.h,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 40.h),
          CommonTextRegular(
            text: title,
            size: 30.sp,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w700,
            color: LightThemeColors.primaryColor,
            fontFamilyType: FontFamilyType.poppins,
          ),
          SizedBox(height: 18.h),
          CommonTextRegular(
            text: subtitle,
            size: 16.sp,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w500,
            color: LightThemeColors.secondaryColor,
            fontFamilyType: FontFamilyType.poppins,
          ),
          SizedBox(height: 32.h),
          CommonTextRegular(
            text: description,
            size: 14.sp,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w400,
            color: LightThemeColors.textSecondary,
            fontFamilyType: FontFamilyType.poppins,
          ),
        ],
      ),
    ),
  );
}

Widget buildSmoothPageIndicator(IntroController controller) {
  return SmoothPageIndicator(
    controller: controller.pageController,
    count: 3,
    effect: ExpandingDotsEffect(
      activeDotColor: LightThemeColors.secondaryColor,
      dotColor: LightThemeColors.disabled,
      dotHeight: 10.h,
      dotWidth: 10.h,
      expansionFactor: 4, // Elongation factor
    ),
  );
}
