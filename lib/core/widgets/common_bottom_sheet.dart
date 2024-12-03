import 'package:get/get.dart';
import 'package:skin_match/core/common/app_common_exports.dart';

class CommonBottomSheet extends StatelessWidget {
  const CommonBottomSheet({
    super.key,
    required this.title,
    this.onClose,
    required this.childWidget,
  });

  final String title;
  final VoidCallback? onClose;
  final Widget childWidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: Get.back,
          child: CircleAvatar(
            backgroundColor: const Color(0xFF4F3C12),
            child: Icon(
              Icons.close,
              color: Get.theme.colorScheme.secondary,
              size: 24.w,
            ),
          ),
        ),
        SizedBox(height: 15.h),
        Container(
          height: 300.h,
          width: Get.width,
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
          decoration: BoxDecoration(
            color: Get.theme.scaffoldBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.r),
              topRight: Radius.circular(40.r),
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 5.h),
              Align(
                alignment: AlignmentDirectional.center,
                child: CommonTextRegular(
                  text: title,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.center,
                  fontFamilyType: FontFamilyType.elMessiri,
                  size: 24.sp,
                ),
              ),
              SizedBox(height: 20.h),
              Expanded(child: childWidget),
            ],
          ),
        ),
      ],
    );
  }
}
