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

        SizedBox(height: 15.h),
        Container(
          height: 200.h,
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
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 5.h),
              Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: CommonTextRegular(
                        text: title,
                        color: context.theme.colorScheme.primary,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.center,
                        size: 16.sp,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: Get.back,
                    child: CircleAvatar(
                      backgroundColor: Get.theme.colorScheme.error,
                      child: Icon(
                        Icons.close,
                        color: Get.theme.colorScheme.surface,
                        size: 20.w,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              SizedBox(child: childWidget),
            ],
          ),
        ),
      ],
    );
  }
}


