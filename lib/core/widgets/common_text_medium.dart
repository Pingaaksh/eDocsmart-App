import 'package:skin_match/core/common/app_common_exports.dart';
import 'package:get/get.dart';

class CommonTextMedium extends StatelessWidget {
  const CommonTextMedium({
    super.key,
    required this.text,
    this.textAlign,
    this.size,
    this.color,
    this.lineHeight,
    this.textOverflow,
    this.maxLine,
    this.decorationColor,
  }) : textDecoration = TextDecoration.none;

  const CommonTextMedium.underline({
    super.key,
    required this.text,
    this.textAlign,
    this.size,
    this.color,
    this.lineHeight,
    this.textOverflow,
    this.maxLine,
    this.decorationColor,
  }) : textDecoration = TextDecoration.underline;

  CommonTextMedium.lineThrough({
    super.key,
    required this.text,
    this.textAlign,
    this.size,
    this.color,
    this.lineHeight,
    this.textOverflow,
    this.maxLine,
  })  : textDecoration = TextDecoration.lineThrough,
        decorationColor = Get.theme.colorScheme.secondaryContainer;

  final String text;
  final TextAlign? textAlign;
  final double? size;
  final Color? color;
  final double? lineHeight;
  final TextDecoration? textDecoration;
  final TextOverflow? textOverflow;
  final int? maxLine;
  final Color? decorationColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Get.theme.textTheme.labelMedium?.copyWith(
          color: color ?? Get.theme.colorScheme.primaryContainer,
          fontSize: size ?? 12.sp,
          height: lineHeight ?? 1,
          decoration: textDecoration,
          decorationColor: decorationColor,
          overflow: textOverflow,),
      maxLines: maxLine,
      textAlign: textAlign ?? TextAlign.center,
    );
  }
}
