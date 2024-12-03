import 'package:skin_match/core/common/app_common_exports.dart';
import 'package:get/get.dart';

class ProfileTileArrowButton extends StatelessWidget {
  final double? size;
  const ProfileTileArrowButton({super.key, this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.theme.colorScheme.primary,
        borderRadius: BorderRadius.all(Radius.circular(size ?? 44.r)),
      ),
      width: size ?? 65.w,
      height: size ??65.w,
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: SvgPicture.asset(
          '',//SVGPath.forwardArrowIcon,
        ),
      ),
    );
  }
}
