import 'package:skin_match/core/common/app_common_exports.dart';
import 'package:get/get.dart';

class CommonButton extends StatelessWidget {
  final Color? bgColor;
  final Color? textColor;
  final String? text;
  final EdgeInsets? padding;
  final VoidCallback onTap;
  final double? width;
  final double? height;
  final String? prefixIcon;
  final double? fontSize;
  final bool isBordered;
  final Color? outLineColor;
  final EdgeInsets? margin;
  final BorderRadius? borderRadius;
  final double? sizedBoxWidth;
  final String? icon;

  CommonButton({
    super.key,
    this.text,
    this.padding,
    this.width,
    this.prefixIcon,
    this.fontSize,
    this.height,
    required this.onTap,
    this.margin,
    this.borderRadius,
    this.outLineColor,
    this.sizedBoxWidth,
    this.icon,
  })  : isBordered = false,
        bgColor = Get.theme.colorScheme.primary,
        textColor = Get.theme.colorScheme.surface;

  CommonButton.secondary({
    super.key,
    this.text,
    this.padding,
    this.width,
    this.prefixIcon,
    this.fontSize,
    this.height,
    required this.onTap,
    this.margin,
    this.borderRadius,
    this.outLineColor,
    this.sizedBoxWidth,
    this.isBordered = true,
    this.icon,
  })  : bgColor = Get.theme.colorScheme.surface,
        textColor = Get.theme.colorScheme.primaryContainer;

  CommonButton.bordered({
    super.key,
    this.text,
    this.padding,
    this.width,
    this.prefixIcon,
    this.fontSize,
    this.height,
    required this.onTap,
    this.margin,
    this.borderRadius,
    this.sizedBoxWidth,
    this.icon,
  })  : isBordered = true,
        bgColor = Colors.transparent,
        outLineColor = Get.theme.colorScheme.primary,
        textColor = Get.theme.colorScheme.primary;

  CommonButton.disabled({
    super.key,
    this.text,
    this.padding,
    this.width,
    this.prefixIcon,
    this.fontSize,
    this.height,
    required this.onTap,
    this.margin,
    this.borderRadius,
    this.sizedBoxWidth,
    this.icon,
    this.outLineColor,
  })  : isBordered = false,
        bgColor = Get.theme.colorScheme.primary.withOpacity(0.60),
        textColor = Get.theme.colorScheme.surface.withOpacity(0.90);

  const CommonButton.custom({
    super.key,
    this.text,
    this.padding,
    this.width,
    this.prefixIcon,
    this.fontSize,
    this.height,
    required this.onTap,
    this.margin,
    this.borderRadius,
    this.sizedBoxWidth,
    this.icon,
    this.outLineColor,
    this.isBordered = false,
    this.bgColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap.call,
      behavior: HitTestBehavior.opaque,
      child: Container(
        margin: margin ?? EdgeInsets.zero,
        width: width,
        height: height ?? 60.h,
        padding: padding ?? EdgeInsets.only(left: 15.w, right: 15.w, top: 18.h, bottom: 18.h),
        decoration: BoxDecoration(
          color: isBordered ? bgColor : bgColor ?? context.theme.colorScheme.primary,
          border: isBordered
              ? Border.all(
                  width: 1.w,
                  color: outLineColor ?? context.theme.colorScheme.outline,
                )
              : Border.all(width: 0, color: Colors.transparent),
          borderRadius: borderRadius ?? BorderRadius.circular(100.r),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if ((icon ?? '').isNotEmpty) ...[
                SvgPicture.asset(
                  icon ?? '',
                  width: 20.w,
                  height: 20.w,
                ),
                SizedBox(width: 7.w),
              ],
              CommonTextMedium(
                text: text ?? 'Next',
                size: fontSize ?? 20.sp,
                color: textColor ?? context.theme.colorScheme.surface,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
