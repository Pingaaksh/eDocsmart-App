import 'package:get/get.dart';
import 'package:skin_match/core/common/app_common_exports.dart';

class DeviceInfoManager extends GetxService {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  Future<DeviceInfoManager> init() async {
    getDeviceId();
    return this;
  }

  void getDeviceId() async {
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceId = androidInfo.id;
    } else {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceId = iosInfo.identifierForVendor ?? '';
    }
  }
}
