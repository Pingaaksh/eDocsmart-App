import 'package:get/get.dart';
import 'package:skin_match/ui/dashboard/controllers/dashboard_controller.dart';
import 'package:skin_match/usecase/document_usecase.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
          () => DashboardController(Get.find<DocumentUseCase>()),
    );
  }
}
