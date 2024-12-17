import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skin_match/core/common/app_common_exports.dart';
import 'package:skin_match/core/global/global_controller.dart';
import 'package:skin_match/core/routes/route_exports.dart';
import 'package:skin_match/usecase/document_usecase.dart';

class DashboardController extends GlobalGetXController with Validator {
DashboardController(this.documentUseCase);
  DocumentUseCase documentUseCase;

  Future documentUpload(context,  Map<String, File> file) async {
    Get.back();
    Map<String, dynamic> request = {};

    try {
      progressService.showProgressDialog(true);

      var response = await documentUseCase.documentUpload(request, file);
      response!.fold(
              (left) => left.getException(),
              (documentUploadModel) {
                Logger.write('document upload model ${documentUploadModel.tableData}');
            Get.toNamed(Routes.SCAN_DETAILS);
          }
      );
    } catch (e) {
      Logger.write('@Login : Error : ${e.toString()}');
    } finally {
      progressService.showProgressDialog(false);
    }

  }


}
