import 'package:get/get.dart';
import 'package:skin_match/core/common/app_common_exports.dart';

class EmptyView extends StatelessWidget {
  final String? animAsset;
  final String message;
  final String title;
  final bool isErrorView;
  final bool? isRefreshShow;
  final VoidCallback? onTap;

  const EmptyView({
    super.key,
    this.animAsset,
    required this.message,
    required this.title,
    this.isErrorView = false,
    this.isRefreshShow = false,
    this.onTap,
  });

  EmptyView.errorView({
    super.key,
    this.onTap,
    this.animAsset,
    required this.message,
  })  : title = LocaleKeys.someThingWentWrong.tr,
        isRefreshShow = true,
        isErrorView = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Opacity(
            opacity: 0.30,
            child: SvgPicture.asset(
              SVGPath.emptyLanguage,
              height: 120.h,
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          CommonTextLarge(text: title, size: 22.sp),
          if (message.isNotEmpty) ...[
            SizedBox(
              height: 10.h,
            ),
            CommonTextRegular(
              text: message,
              size: 14.sp,
              color: context.theme.colorScheme.secondaryContainer,
            ),
          ],
          SizedBox(
            height: 80.h,
          ),
          if (isRefreshShow ?? false) ...[
            CommonButton(
              width: 340.w,
              height: 100.h,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 0.h),
              onTap: () => onTap?.call(),
              text: isErrorView ? LocaleKeys.tryAgain.tr : LocaleKeys.refresh.tr,
            ),
          ],
        ],
      ),
    );
  }
}
