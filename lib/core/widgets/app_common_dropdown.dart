import 'package:get/get.dart';
import 'package:skin_match/core/common/app_common_exports.dart';

class CommonDropdown extends StatelessWidget {
  const CommonDropdown({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.suffixIcon,
  });

  final String icon;
  final String? suffixIcon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: EdgeInsets.only(left: 14.w, right: 20.w),
        decoration: commonBoxDecoration(),
        width: Get.width,
        height: 55.h,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 14.h),
              child: SvgPicture.asset(icon),
            ),
            SizedBox(width: 15.w),
            Expanded(
              child: CommonTextRegular(
                text: title,
                color: context.theme.colorScheme.primaryContainer,
                size: 15.sp,
              ),
            ),
            suffixIcon != null
                ? Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.h),
                    child: SvgPicture.asset(
                      suffixIcon ?? '',
                      width: 24.w,
                      height: 24.w,
                    ),
                  )
                : const Icon(Icons.keyboard_arrow_down_rounded),
          ],
        ),
      ),
    );
  }
}
