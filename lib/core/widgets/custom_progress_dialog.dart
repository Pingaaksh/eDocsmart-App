
import 'package:get/get.dart';
import 'package:skin_match/core/common/app_common_exports.dart';

class CustomProgressDialog extends StatelessWidget {
  const CustomProgressDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(15.r)),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        decoration: BoxDecoration(
          color: context.theme.colorScheme.surface.withOpacity(0.70),
          borderRadius: BorderRadius.all(Radius.circular(15.r)),
          border: Border.all(
            width: 0.2.w,
            color: context.theme.colorScheme.surface,
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x20000000),
              blurRadius: 25,
              offset: Offset(0, 15),
            ),
          ],
        ),
        child: CircularProgressIndicator(strokeWidth: 5.w),
      ),
    );
  }
}
