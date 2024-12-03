import 'package:skin_match/core/common/app_common_exports.dart';
import 'package:get/get.dart';

class CommonTextRegular extends StatelessWidget {
  const CommonTextRegular({
    super.key,
    required this.text,
    this.textAlign,
    this.size,
    this.color,
    this.lineHeight,
    this.fontWeight,
    this.textOverflow,
    this.maxLine,
    this.decorationColor,
    this.fontStyle = FontStyle.normal,
    this.fontFamilyType,
  }) : textDecoration = TextDecoration.none;

  const CommonTextRegular.underline({
    super.key,
    required this.text,
    this.textAlign,
    this.size,
    this.color,
    this.lineHeight,
    this.fontWeight,
    this.textOverflow,
    this.maxLine,
    this.decorationColor,
    this.fontStyle = FontStyle.normal,
    this.fontFamilyType,
  }) : textDecoration = TextDecoration.underline;

  CommonTextRegular.lineThrough({
    super.key,
    required this.text,
    this.textAlign,
    this.size,
    this.color,
    this.lineHeight,
    this.fontWeight,
    this.textOverflow,
    this.maxLine,
    this.fontStyle = FontStyle.normal,
    this.fontFamilyType,
  })  : textDecoration = TextDecoration.lineThrough,
        decorationColor = Get.theme.colorScheme.secondaryContainer;

  final String text;
  final TextAlign? textAlign;
  final double? size;
  final Color? color;
  final double? lineHeight;
  final TextDecoration? textDecoration;
  final FontWeight? fontWeight;
  final TextOverflow? textOverflow;
  final int? maxLine;
  final Color? decorationColor;
  final FontStyle fontStyle;
  final FontFamilyType? fontFamilyType;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Get.theme.textTheme.labelSmall?.copyWith(
        color: color ?? Get.theme.colorScheme.primaryContainer,
        fontSize: size ?? 10.sp,
        height: lineHeight ?? 1.2,
        decoration: textDecoration,
        fontStyle: fontStyle,
        fontFamily: fontFamilyType?.name ?? FontFamilyType.productSansBold.name,
        decorationColor: decorationColor,
        fontWeight: fontWeight,
        overflow: textOverflow,
      ),
      maxLines: maxLine,
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}
