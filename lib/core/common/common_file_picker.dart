import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skin_match/core/common/app_common_exports.dart';

class CameraHelper {
  static Future<XFile?> openCamera() async {
    final ImagePicker picker = ImagePicker();
    try {
      XFile? image = await picker.pickImage(source: ImageSource.camera);
      return image;
    } catch (e) {
      print("Error opening camera: $e");
      return null;
    }
  }}

class GalleryHelper {
  static Future<XFile?> openGallery() async {
    final ImagePicker picker = ImagePicker();
    try {
      XFile? image = await picker.pickImage(source: ImageSource.gallery);
      return image;
    } catch (e) {
      print("Error opening gallery: $e");
      return null;
    }
  }}

class FilePickerHelper {
  static Future<File?> pickFile() async {
    try {
      final result = await FilePicker.platform.pickFiles();
      if (result != null && result.files.single.path != null) {
        return File(result.files.single.path!);
      } else {
        print("No file selected");
        return null;
      }
    } catch (e) {
      print("Error picking file: $e");
      return null;
    }
  }
}