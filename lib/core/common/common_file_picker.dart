import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
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
      XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80, // Optional: Compress the image (0-100)
      );
      if (image == null) {
        print("User canceled image selection.");
        return null;
      }
      final String filePath = image.path;
      final String fileExtension = filePath.split('.').last.toLowerCase();
      final String? mimeType = lookupMimeType(filePath);

      if (fileExtension == 'jpg' || fileExtension == 'jpeg' || fileExtension == 'png'  &&
          (mimeType == 'image/jpeg' || mimeType == 'image/png')) {
        print("Selected file: ${image.path}");
        return image;
      } else {
        print("Invalid file type selected. Only JPG, JPEG, and PNG are allowed.");
        return null; // Reject unsupported file types
      }
    } catch (e) {
      print("Error opening gallery: $e");
      return null;
    }
  }}

class FilePickerHelper {
  static Future<File?> pickFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(allowedExtensions: ['pdf', 'jpeg', 'jpg', 'png']);
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