import 'package:skin_match/core/common/app_common_exports.dart';
import 'package:get/get.dart';

class CustomAnimDialog extends StatelessWidget {
  final String message;
  final String title;
  final Function? onTap;
  final String? positiveText;
  final String? negativeText;
  final Function? onNegativeTap;
  final TextAlign textAlign;
  final bool isDismissible;
  final String lottieAnimPath;
  final double? animHeight;
  final bool repeat;

  const CustomAnimDialog({
    this.lottieAnimPath = '',
    this.message = '',
    this.title = 'Error!',
    this.onTap,
    this.onNegativeTap,
    this.textAlign = TextAlign.center,
    this.positiveText,
    this.negativeText,
    this.isDismissible = true,
    this.animHeight,
    this.repeat = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) => isDismissible,
      child: AlertDialog(
        scrollable: true,
        shadowColor: const Color(0x12000000),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15.r),
          ),
        ),
        title: Padding(
          padding:  EdgeInsets.only(top:46.h),
          child: Align(
            alignment: AlignmentDirectional.center,
            child: SvgPicture.asset(
              SVGPath.successIcon,
              height: animHeight ?? 65.w,
              width: animHeight ?? 65.w,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        content: Column(
          children: [
            SizedBox(height: 33.h),
            CommonTextRegular(text: title, size: 26.sp,fontWeight: FontWeight.w700,color:context.theme.colorScheme.primary ,),
            SizedBox(height: 10.h),
            CommonTextRegular(
              text: message,
              size: 14.sp,
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.center,
              color:  context.theme.colorScheme.onTertiaryContainer,
            ).paddingSymmetric(horizontal: 20.w),
            SizedBox(height: 10.h),
          ],
        ),
        contentPadding: EdgeInsets.only(bottom: 20.h, top: 0.h),
        actionsPadding: EdgeInsets.only(bottom: 30.h, left: 30.w, right: 30.w),
        actions: positiveText != null
            ? <Widget>[
                Align(
                  alignment: AlignmentDirectional.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (negativeText != null) ...[
                        Expanded(
                          child: CommonButton.bordered(
                            text: negativeText,
                            onTap: () {
                              _closeDialog(context);
                              onNegativeTap?.call();
                            },
                          ),
                        ),
                        SizedBox(width: 30.w),
                      ],
                      CommonButton(
                        width: 152.w,
                        text: positiveText,
                        onTap: () {
                          _closeDialog(context);
                          onTap?.call();
                        },
                      ),
                    ],
                  ),
                ),
              ]
            : null,
      ),
    );
  }

  void _closeDialog(BuildContext context) {
    Get.close(1);
  }
}
