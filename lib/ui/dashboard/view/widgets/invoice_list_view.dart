import 'package:get/get.dart';
import 'package:skin_match/core/common/app_common_exports.dart';

Expanded invoiceList() {
  return Expanded(
    child: Padding(
      padding: EdgeInsets.only(right: 30.w, left: 30.w),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: 5,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15.w,
          mainAxisSpacing: 15.h,
        ),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.w, color: const Color(0xFFF2F2F2),
              ),
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 70.h,
                        decoration: BoxDecoration(
                          color: context.theme.colorScheme.surfaceVariant,
                          // image: const DecorationImage(
                          //   image: AssetImage(
                          //     PNGPath.invoiceVectorIc,
                          //   ),
                          // ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.r),
                            topRight: Radius.circular(10.r),
                          ),
                        ),
                        child: Image.asset(PNGPath.invoiceVectorIc,width: 37,height: 34,),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 12.h),
                      CommonTextRegular(
                        text: 'INVOICE-012234-22',
                        size: 10.sp,
                        fontWeight: FontWeight.w600,
                        color: context.theme.colorScheme.primary,
                      ),
                      SizedBox(height: 7.h),
                      CommonTextRegular(
                        text: 'Smith John',
                        size: 10.sp,
                        fontWeight: FontWeight.w500,
                        color: context.theme.colorScheme.onTertiaryContainer,
                      ),
                      SizedBox(height: 11.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonTextRegular(
                                text: 'Created on',
                                size: 8.sp,
                                fontWeight: FontWeight.w500,
                                color: context.theme.colorScheme.onTertiaryContainer,
                              ),
                              SizedBox(height: 4.h),
                              CommonTextRegular(
                                text: '10-12-2024',
                                size: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: context.theme.colorScheme.secondaryContainer,
                              ),
                            ],
                          ),
                          CommonButton.custom(
                            onTap: () {
                              Get.toNamed(Routes.SCAN_DETAILS);
                            },
                            width: 60.w,
                            height: 20.h,
                            bgColor: context.theme.colorScheme.secondary,
                            text: LocaleKeys.view,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    ),
  );
}