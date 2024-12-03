import 'package:skin_match/core/common/app_common_exports.dart';
import 'package:get/get.dart';

class CommonMenuButton extends StatelessWidget {
  final Color? bgColor;
  final Color? iconColor;
  final VoidCallback onTap;
  final double? width;
  final double? height;
  final String icon;
  final double? iconWidth;
  final bool isBordered;
  final Color? outLineColor;

  CommonMenuButton({
    super.key,
    this.width,
    this.height,
    required this.onTap,
    this.outLineColor,
    required this.icon,
    this.iconWidth,
  })  : isBordered = true,
        iconColor = Get.theme.colorScheme.primaryContainer,
        bgColor = Get.theme.colorScheme.surface;

  CommonMenuButton.secondary({
    super.key,
    this.width,
    this.height,
    required this.onTap,
    this.outLineColor,
    required this.icon,
    this.iconWidth,
  })  : isBordered = false,
        iconColor = Get.theme.colorScheme.surface,
        bgColor = Get.theme.colorScheme.primaryContainer;

  CommonMenuButton.bordered({
    super.key,
    this.width,
    this.height,
    required this.onTap,
    required this.icon,
    this.iconWidth,
  })  : isBordered = true,
        bgColor = Colors.transparent,
        iconColor = Get.theme.colorScheme.primaryContainer,
        outLineColor = Get.theme.colorScheme.primaryContainer.withOpacity(0.70);

  CommonMenuButton.disabled({
    super.key,
    this.width,
    this.height,
    required this.onTap,
    required this.icon,
    this.iconWidth,
  })  : isBordered = true,
        bgColor = Get.theme.colorScheme.primaryContainer.withOpacity(0.10),
        iconColor = Get.theme.colorScheme.primaryContainer.withOpacity(0.10),
        outLineColor = Get.theme.colorScheme.primaryContainer.withOpacity(0.10);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap.call,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: width ?? 40.w,
        height: height ?? 40.w,
        decoration: BoxDecoration(
          color: isBordered ? bgColor : bgColor ?? context.theme.colorScheme.primary,
          border: isBordered
              ? Border.all(
                  width: 1.w,
                  color: outLineColor ?? context.theme.colorScheme.outline,
                )
              : Border.all(width: 0, color: Colors.transparent),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: SvgPicture.asset(
            icon,
            width: iconWidth ?? 15.w,
            height: iconWidth ?? 15.w,
          ),
        ),
      ),
    );
  }
}
