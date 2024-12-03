import 'package:skin_match/core/common/app_common_exports.dart';
import 'package:get/get.dart';

class BottomSheetGreyBar extends StatelessWidget {
  final double? width;
  final double? height;
  const BottomSheetGreyBar({
    super.key,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 177.w,
      height: height ?? 15.h,
      decoration: BoxDecoration(
        color: context.theme.colorScheme.outline,
        borderRadius: BorderRadius.all(
          Radius.circular(
            8.r,
          ),
        ),
      ),
    );
  }
}
