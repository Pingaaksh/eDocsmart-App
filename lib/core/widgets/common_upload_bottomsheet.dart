import 'package:get/get.dart';
import 'package:skin_match/core/common/common_file_picker.dart';
import 'package:skin_match/core/widgets/common_bottom_sheet.dart';
import '../common/app_common_exports.dart';

void showCustomBottomSheet(BuildContext context) {
  Get.bottomSheet(
    CommonBottomSheet(
      title: LocaleKeys.uploadYourScan,
      onClose: () {},
      childWidget: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildOption(PNGPath.camera, LocaleKeys.camera, () async {
            var image = await CameraHelper.openCamera();
            if (image != null) {
              Logger.write("Image captured: ${image.path}");
            }else{
              Logger.write('file not pick');
            }
          }),
          _buildOption(PNGPath.gallery, LocaleKeys.gallery, () async {
            var image = await GalleryHelper.openGallery();
            if (image != null) {
              Logger.write("Image selected: ${image.path}");
            }else{
              Logger.write('file not pick');
            }
          }),
          _buildOption(PNGPath.upload, LocaleKeys.upload, () async {
            var file = await FilePickerHelper.pickFile();
            if (file != null) {
              Logger.write('file pick ${file.path}');

              }else{
              Logger.write('file not pick');
            }
          }),
        ],
      ),
    ),
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
  );
}

Widget _buildOption(String path, String label, VoidCallback onTap) {
  return Column(
    children: [
      GestureDetector(
        onTap: onTap,
        child: Image.asset(
          path,
          height: 60.h,
          width: 60.w,
        ),
      ),
      SizedBox(height: 8.h),
      CommonTextRegular(
        text: label,
        size: 16.sp,
        fontWeight: FontWeight.w500,
        color: Get.theme.colorScheme.primary,
      ),
    ],
  );
}
