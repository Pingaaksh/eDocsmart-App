import 'package:skin_match/core/common/app_common_exports.dart';

class CommonCircleProfile extends StatelessWidget {
  const CommonCircleProfile({
    super.key,
    required this.imageUrl,
    this.size,
    this.borderColor,
    this.borderSize,
    this.paddingPlaceHolder,
    this.isFromLocal = false,
  });

  final String imageUrl;
  final double? size;
  final Color? borderColor;
  final double? borderSize;
  final double? paddingPlaceHolder;
  final bool isFromLocal;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size ?? 168.w,
      height: size ?? 168.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor ?? Colors.transparent,
          width: borderSize ?? 0,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(
            84.r,
          ),
        ),
        child: ImagePlaceHolder(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          paddingPlaceHolder: paddingPlaceHolder,
          width: size ?? 168.w,
          height: size ?? 168.w,
        ),
      ),
    );
  }
}
