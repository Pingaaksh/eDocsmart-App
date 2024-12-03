import 'package:get/get.dart';
import 'package:skin_match/core/common/app_common_exports.dart';

class LoadMore extends StatelessWidget {
  const LoadMore({super.key, this.title});
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 80.h,
            width: 80.h,
            child: CircularProgressIndicator(
              strokeWidth: 10.w,
              valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            width: 40.w,
          ),
          Text(
            title ?? LocaleKeys.loading.tr,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  fontSize: 45.sp,
                  color: context.theme.colorScheme.primary,
                ),
          ),
        ],
      ),
    );
  }
}
