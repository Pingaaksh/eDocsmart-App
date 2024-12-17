import 'package:get/get.dart';
import 'package:skin_match/core/common/app_common_exports.dart';
import 'package:skin_match/core/widgets/app_common_back_button.dart';
import 'package:skin_match/ui/scan_details/export_scan.dart';

class ScanDetailsView extends GetView<ScanDetailsController> {
  const ScanDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonBackButton(
        onBack: Get.back,
        title: LocaleKeys.scanDetails,
      ),
      body: Column(
        children: [
          _buildTabs(),
          SizedBox(height: 10.h),
          _buildTableHeader(),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: controller.textData?.entries.map((entry) {
                return Container(
                        padding: EdgeInsets.only(left: 30.w, right: 30.w),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 3,
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 20.h,right: 5.w),
                                  child: CommonTextRegular(text:entry.key.toString(), size:  12.sp,fontWeight: FontWeight.w400,),
                                )),
                            // Expanded(
                            //     child: Container(
                            //         padding: EdgeInsets.only(bottom: 20.h,left: 5.w,right: 5.w),
                            //         color: Get.theme.colorScheme.surfaceVariant,
                            //         alignment: Alignment.center,
                            //         child:
                            //             CommonTextRegular(text:'', size: 12.sp,fontWeight: FontWeight.w600,),),),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding:  EdgeInsets.only(bottom: 20.h,left: 5.w),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: CommonTextRegular(
                                    text:entry.value!=null?entry.value.toString(): "N/A",
                                      size: 12.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Get.theme.colorScheme.primary,

                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
              }).toList() ??
                  [],
            ),
          ),
        ],
      ),
      floatingActionButton: _buildFAB(),
    );
  }

  Widget _buildTabs() {
    return Padding(
      padding: EdgeInsets.only(top: 27.h),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Get.theme.colorScheme.surfaceVariant,
                borderRadius: BorderRadius.circular(50.r),
              ),
              child: Row(
                children: [
                  _buildTab(LocaleKeys.details, 0),
                  _buildTab(LocaleKeys.otherFiles, 1),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String title, int index) {
    bool isSelected = controller.selectedIndex.value == index;

    return GestureDetector(
      onTap: () {
        controller.selectedIndex.value = index;
      },
      child: Container(
        width: 136.w,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 9.h),
        decoration: BoxDecoration(
          color:
              isSelected ? Colors.green : Get.theme.colorScheme.surfaceVariant,
          borderRadius: BorderRadius.circular(50.r),
        ),
        child: CommonTextRegular(
          text: title,
          size: 12.sp,
          color: isSelected ? Colors.white : Get.theme.colorScheme.primary,
          fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
        ),
      ),
    );
  }

  Widget _buildTableHeader() {
    return Container(
      padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 29.h),
      child: Row(
        children: [
          _tableHeaderCell(LocaleKeys.key, flex: 3, alignment: Alignment.centerLeft),
          // _tableHeaderCell(LocaleKeys.qty,
          //     flex: 1,
          //     alignment: Alignment.center,
          //     color: Get.theme.colorScheme.surfaceVariant),
          _tableHeaderCell(LocaleKeys.value, flex: 2, alignment: Alignment.centerRight),
        ],
      ),
    );
  }

  Widget _tableHeaderCell(String title,
      {required int flex, required AlignmentGeometry alignment, Color? color}) {
    return Expanded(
      flex: flex,
      child: Container(
        alignment: alignment,
        padding: EdgeInsets.only(top: 10.h, bottom: 16.h),
        color: color ?? Get.theme.colorScheme.surface,
        child: CommonTextRegular(
          text: title,
          size: 12.sp,
          fontWeight: FontWeight.w600,
          color: Get.theme.colorScheme.primary,
        ),
      ),
    );
  }

  // Widget _buildTableRows() {
  //   return Column(
  //     children:
  //         controller.tableData.map((data) => _buildTableRow(data)).toList(),
  //   );
  // }
  //
  // Widget _buildTableRow(Map<String, String> rowData) {
  //   return Container(
  //     padding: EdgeInsets.only(left: 30.w, right: 30.w),
  //     child: Row(
  //       children: [
  //         Expanded(
  //             flex: 3,
  //             child: Padding(
  //               padding: EdgeInsets.only(bottom: 20.h,right: 5.w),
  //               child: CommonTextRegular(text:rowData['key']!, size:  12.sp,fontWeight: FontWeight.w400,),
  //             )),
  //         Expanded(
  //             child: Container(
  //                 padding: EdgeInsets.only(bottom: 20.h,left: 5.w,right: 5.w),
  //                 color: Get.theme.colorScheme.surfaceVariant,
  //                 alignment: Alignment.center,
  //                 child:
  //                     CommonTextRegular(text:rowData['qty']!, size: 12.sp,fontWeight: FontWeight.w600,),),),
  //         Expanded(
  //           flex: 2,
  //           child: Padding(
  //             padding:  EdgeInsets.only(bottom: 20.h,left: 5.w),
  //             child: Align(
  //               alignment: Alignment.centerRight,
  //               child: CommonTextRegular(
  //                 text:rowData['value']!,
  //                   size: 12.sp,
  //                   fontWeight: FontWeight.w600,
  //                   color: Get.theme.colorScheme.primary,
  //
  //               ),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }


  Widget _buildTableRows() {
    return Column(
      // children: controller.tableData.map((data) => _buildTableRow(data)).toList(),
    );
  }

  Widget _buildTableRow(Map<String, dynamic> rowData) {
    return Container(
      padding: EdgeInsets.only(left: 30.w, right: 30.w),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.only(bottom: 20.h, right: 5.w),
              child: CommonTextRegular(
                text: rowData['key']?.toString() ?? 'N/A',
                size: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(bottom: 20.h, left: 5.w, right: 5.w),
              color: Get.theme.colorScheme.surfaceVariant,
              alignment: Alignment.center,
              child: CommonTextRegular(
                text: rowData['qty']?.toString() ?? '0',
                size: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.only(bottom: 20.h, left: 5.w),
              child: Align(
                alignment: Alignment.centerRight,
                child: CommonTextRegular(
                  text: rowData['value']?.toString() ?? '0',
                  size: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: Get.theme.colorScheme.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildFAB() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          heroTag: 'download',
          backgroundColor: Colors.green,
          onPressed: () {},
          child: Icon(Icons.arrow_downward, color: Colors.white),
        ),
        SizedBox(height: 10.h),
        FloatingActionButton(
          heroTag: 'share',
          backgroundColor: Colors.blue,
          onPressed: () {},
          child: Icon(Icons.share, color: Colors.white),
        ),
      ],
    );
  }
}
