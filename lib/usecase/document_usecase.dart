import 'package:fpdart/fpdart.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skin_match/core/common/app_common_exports.dart';
import 'package:skin_match/models/remote/document_upload_model.dart';


class DocumentUseCase extends UseCase {
  final ApiProvider apiProvider;

  DocumentUseCase(this.apiProvider);


  Future<Either<Exception, DocumentUploadModel>?> documentUpload(
      Map<String, dynamic> request,
    Map<String, File> file,
      ) async {
    try {
      ResponseHandler? responseHandler = await apiProvider.documentUpload(request, file);

      if (responseHandler != null && responseHandler.isSuccess) {
        DocumentUploadModel? documentUploadModel = tryParseJsonObject<DocumentUploadModel?>(
              () => DocumentUploadModel.fromJson(responseHandler.result),
        );

        return documentUploadModel != null
            ? Either.right(documentUploadModel)
            : Either.left(CustomException(responseHandler.message ?? ''));

      } else {
        Logger.write('API Error: ${responseHandler!.message}');
        return Either.left(CustomException(responseHandler.message ?? ''));
      }
    } on Exception catch (e) {
      Logger.write('API Exception: $e');
      return Either.left(e);
    }
  }

}
