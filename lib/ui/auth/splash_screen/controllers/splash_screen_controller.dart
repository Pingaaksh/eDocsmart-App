import 'package:get/get.dart';
import 'package:skin_match/core/common/app_common_exports.dart';

class SplashScreenController extends GetxController with GetSingleTickerProviderStateMixin {
  SplashScreenController();

  bool isFromDeeplink = false;

  @override
  void onInit() {
    super.onInit();
    ThemeResource().getSelectedThemeMode();
  }

  @override
  void onReady() {
    super.onReady();
    Future.delayed(
      const Duration(milliseconds: 3000),
      () => Get.offAllNamed(Routes.INTRO_SCREEN),
    );
  }

  // // Called when app is Killed and tap on Deeplink
  // Future<void> _initURIHandler() async {
  //   if (!_initialURILinkHandled) {
  //     _initialURILinkHandled = true;
  //     try {
  //       final initialURI = await getInitialUri();
  //       if (initialURI != null) {
  //         debugPrint('Initial URI received $initialURI');
  //         debugPrint('Received URI: $initialURI');
  //         debugPrint('Query Parameter : ${initialURI.queryParameters}');
  //         redirectDeeplink(initialURI);
  //       } else {
  //         debugPrint('Null Initial URI received');
  //         redirectDeeplink(initialURI);
  //       }
  //     } on Exception {
  //       redirectDeeplink(null);
  //       debugPrint('Failed to receive initial uri');
  //     }
  //   }
  // }
  //
  // // Called when app is already opened and you tap on Deeplink
  // void _incomingLinkHandler() {
  //   uriLinkStream.listen(
  //     (Uri? uri) {
  //       debugPrint('Received URI: $uri');
  //       debugPrint('Query Parameter : ${uri?.queryParameters}');
  //       redirectDeeplinkOpened(uri);
  //     },
  //     onError: (Object err) {
  //       debugPrint('Error occurred: $err');
  //       if (err is FormatException) {
  //       } else {}
  //     },
  //   );
  // }

  void redirectDeeplinkOpened(Uri? uri) async {
    Logger.write('DeepLink Redirect URI : $uri');
    /*DeeplinkResponse? response = tryParseJsonObject<DeeplinkResponse?>(
      () => DeeplinkResponse.fromJson(uri?.queryParameters ?? {}),
    );
    debugPrint('Response : ${response?.toJson()}');
    if (response != null && response.uniqueId != null) {
      if (Get.currentRoute == Routes.PRODUCT_DETAILS) {
        Get.find<ProductDetailController>().setProductDetails(
          response.slug ?? '',
          response.uniqueId ?? '',
        );
          Get.find<ProductDetailController>().getProductDetails();
      } else {
        Get.toNamed(
          Routes.PRODUCT_DETAILS,
          arguments: [
            response.uniqueId,
            response.slug,
          ],
        );
      }
    }*/
  }

  void redirectDeeplink(Uri? uri) async {
    Logger.write('DeepLink Redirect URI : $uri');
    /*DeeplinkResponse? response = tryParseJsonObject<DeeplinkResponse?>(
      () => DeeplinkResponse.fromJson(uri?.queryParameters ?? {}),
    );
    debugPrint('Response : ${response?.toJson()}');
    String token = await sharedPreferenceService.getToken() ?? '';
    Logger.write('Token: ${sharedPreferenceService.getToken()}');
    animController.forward();
    animController.addListener(() {
      switch (animController.status) {
        case AnimationStatus.completed:
          if (response != null && response.uniqueId != null) {
            if (Get.currentRoute == Routes.PRODUCT_DETAILS) {
              Get.find<ProductDetailController>().setProductDetails(
                response.slug ?? '',
                response.uniqueId ?? '',
              );
              Get.find<ProductDetailController>().getProductDetails();
            } else {
              Get.offAllNamed(
                Routes.PRODUCT_DETAILS,
                arguments: [
                  response.uniqueId,
                  response.slug,
                ],
              );
            }
          } else {
            Get.offAllNamed(
              token.isEmpty ? Routes.INTRO_SCREEN : Routes.DASHBOARD,
            );
          }

        default:
      }
    });*/
  }
}
