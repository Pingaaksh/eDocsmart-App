import 'package:get/get.dart';
import 'package:skin_match/core/common/app_common_exports.dart';

class CommonBackButton extends StatelessWidget implements PreferredSizeWidget {
  const CommonBackButton({
    super.key,
    required this.onBack,
    this.title,
  });

  final VoidCallback onBack;
  final String? title;

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(Get.width, 70.h);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: Get.width,
        child: Padding(
          padding:  EdgeInsets.only(left: 30.w,right: 30.h,top: 20.h),
          child: Row(
            children: [
              GestureDetector(
                onTap: onBack.call,
                behavior: HitTestBehavior.opaque,
                child: ClipOval(
                  child: SvgPicture.asset(
                    SVGPath.backIcon,
                    height: 40.h,
                    width: 40.w,
                  ),
                ),
              ),
              if ((title ?? '').isNotEmpty) ...[
                Expanded(
                  child: CommonTextRegular(
                    text: title ?? '',
                    size: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: context.theme.colorScheme.primary,
                    textAlign: TextAlign.center,
                  ),
                ),
                // SizedBox(width: 80.w),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
