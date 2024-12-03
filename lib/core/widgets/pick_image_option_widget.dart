import 'package:skin_match/core/common/app_common_exports.dart';
import 'package:get/get.dart';

enum MediaOptionEnum { camera, gallery, remove }

class PickImageOptionWidget extends StatelessWidget {
  const PickImageOptionWidget({
    super.key,
    required this.onTap,
    required this.title,
  });

  final String title;
  final Function(MediaOptionEnum) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.35,
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(60.r),
          topRight: Radius.circular(60.r),
        ),
        color: context.theme.colorScheme.surface,
      ),
      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 40.h),
      child: SafeArea(
        child: Column(
          children: [
            Container(
              width: 177.w,
              height: 15.h,
              decoration: BoxDecoration(
                color: context.theme.colorScheme.outline,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    8.r,
                  ),
                ),
              ),
            ),
            SizedBox(height: 53.h),
            CommonTextMedium(
              text: title,
              size: 50.sp,
            ),
            SizedBox(height: 69.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                pickImageItem(
                  LocaleKeys.camera.tr,
                  SVGPath.cameraIcon,
                  onTap: () => onTap.call(MediaOptionEnum.camera),
                ),
                pickImageItem(
                  LocaleKeys.gallery.tr,
                  SVGPath.galleryIcon,
                  onTap: () => onTap.call(MediaOptionEnum.gallery),
                ),
                pickImageItem(
                  LocaleKeys.remove.tr,
                  SVGPath.deleteIcon,
                  onTap: () => onTap.call(MediaOptionEnum.remove),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget pickImageItem(
    String name,
    String icon, {
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 80.w, vertical: 50.w),
        decoration: BoxDecoration(
          color: const Color(0xFFF6F6F6),
          borderRadius: BorderRadius.circular(
            40.r,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150.w,
              height: 150.w,
              padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 40.h),
              decoration: BoxDecoration(
                color: Get.theme.colorScheme.primary,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(icon),
            ),
            SizedBox(height: 15.h),
            CommonTextMedium(
              text: name,
              size: 32.sp,
            ),
          ],
        ),
      ),
    );
  }
}
