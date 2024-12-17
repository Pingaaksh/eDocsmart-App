import 'package:get/get.dart';
import 'package:skin_match/core/common/app_common_exports.dart';
import 'package:skin_match/ui/dashboard/export_dashboard.dart';
import '../../../core/widgets/common_upload_bottomsheet.dart';


class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.colorScheme.primary,
      child: SafeArea(
        child: Scaffold(
          floatingActionButton: GestureDetector(onTapUp: (details) {
            return showCustomBottomSheet(context);
          },child: Image.asset(PNGPath.scanDocIc,height: 70.h,width: 70.w,),),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.primary,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40.r),
                    bottomRight: Radius.circular(40.r),
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 20.h,
                  horizontal: 30.w,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50.h,
                          width: 50.w,
                          child: Image.asset(PNGPath.userProfileIc),
                        ),
                        Expanded(
                          child: ListTile(
                            title: CommonTextRegular(
                              text: 'MR. SMITH JOHN',
                              color: context.theme.colorScheme.surface,
                              fontWeight: FontWeight.w700,
                              size: 18.sp,
                            ),
                            subtitle: CommonTextRegular(
                                text: 'Pharmaceutical',
                                color: context.theme.colorScheme.surface,
                                fontWeight: FontWeight.w400,
                                size: 12.sp,),
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
                          width: 40.w,
                          child: Image.asset(PNGPath.notificationIc),
                        ),
                      ],
                    ),
                    SizedBox(height: 28.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildActionIcon(PNGPath.invoiceIc, 'Invoice'),
                        _buildActionIcon(PNGPath.gstBillIc, 'GST Bill'),
                        _buildActionIcon(PNGPath.passPortIc, 'Passport'),
                        _buildActionIcon(PNGPath.viewMoreIc, 'View More'),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 26.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LocaleKeys.recentScans,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: context.theme.colorScheme.primary,
                      ),
                    ),
                    CommonTextRegular(
                      text: LocaleKeys.viewMore,
                      fontWeight: FontWeight.w400,
                      size: 14.sp,
                      color: context.theme.colorScheme.onTertiaryContainer,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 23.h),
              invoiceList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionIcon(String path, String label) {
    return Column(
      children: [
        Image.asset(
          path,
          height: 50.h,
          width: 50.h,
        ),
        SizedBox(height: 13.h),
        Text(label, style: TextStyle(color: Get.theme.colorScheme.surface)),
      ],
    );
  }
}
