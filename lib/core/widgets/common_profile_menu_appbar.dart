import 'package:flutter/services.dart';
import 'package:skin_match/core/common/app_common_exports.dart';
import 'package:skin_match/core/widgets/app_common_menu_button.dart';
import 'package:get/get.dart';

class ProfileMenuAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final String titleText;
  final List<Widget>? actions;
  final VoidCallback onBackTap;
  final bool isBack;

  const ProfileMenuAppBar({
    super.key,
    this.title,
    required this.onBackTap,
    this.actions,
    this.titleText = '',
    this.isBack = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark, //<-- For Android SEE HERE (dark icons)
        statusBarBrightness: Brightness.light, //<-- For iOS SEE HERE (dark icons)
        statusBarColor: Colors.transparent,
      ),
      clipBehavior: Clip.none,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: title ??
          CommonTextRegular(
            text: titleText,
            size: 20.sp,
            fontWeight: FontWeight.w600,
          ),
      leadingWidth: 75.w,
      leading: CommonMenuButton(
        onTap: onBackTap.call,
        icon: isBack ? PNGPath.backIcon : SVGPath.menuIcon,
        iconWidth: isBack ? 15.w : 21.w,
      ).marginOnly(left: 25.w),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(75.h);
}
