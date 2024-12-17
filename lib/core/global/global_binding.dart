import 'package:get/get.dart';
import 'package:skin_match/core/common/app_common_exports.dart';
import 'package:skin_match/core/global/global_controller.dart';
import 'package:skin_match/usecase/auth_usecase.dart';
import 'package:skin_match/usecase/document_usecase.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GlobalGetXController());
    Get.put<BaseApiProvider>(
      BaseApiProviderImpl.instance,
      permanent: true,
    );
    Get.put<ApiProvider>(ApiProvider(Get.find()));
    Get.put(AuthUseCase(Get.find<ApiProvider>()), permanent: true);
    Get.put(DocumentUseCase(Get.find<ApiProvider>()), permanent: true);
  }
}
