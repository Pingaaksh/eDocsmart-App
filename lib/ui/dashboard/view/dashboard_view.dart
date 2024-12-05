import 'package:get/get.dart';
import 'package:skin_match/core/common/app_common_exports.dart';
import 'package:skin_match/ui/auth/login/export_login.dart';

class DashboardView extends GetView<LoginController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 38.w),
            child: Align(
              alignment: Alignment.centerLeft,
              child: CommonTextRegular(
                text: 'Working in Progress',
                size: 26.sp,
                fontWeight: FontWeight.w700,
                color: LightThemeColors.primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
