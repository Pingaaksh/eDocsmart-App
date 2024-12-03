import 'package:skin_match/core/common/app_common_exports.dart';
import 'package:skin_match/core/widgets/common_anim_dialog.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

typedef JsonParser<T> = T Function(Map<String, dynamic> json);

typedef PlaceholderBuilder = Widget Function(
  BuildContext context,
  String url,
);

typedef LoadingErrorBuilder = Widget Function(
  BuildContext context,
  String url,
  dynamic error,
);

typedef FilterResult = Function({
  String? categories,
  int? minValue,
  int? maxValue,
});

PlaceholderBuilder? getPlaceHolder({bool isBanner = false}) {
  return (_, __) {
    return Image.asset(
      PNGPath.splashLogo,
    );
  };
}

LoadingErrorBuilder? getErrorPlaceHolder({bool isBanner = false}) {
  return (_, __, ___) {
    return Image.asset(
      PNGPath.splashLogo,
    );
  };
}

void logoutDialog() {
  showCommonDialog(
    title: LocaleKeys.logout.tr,
    message: LocaleKeys.logoutDesc.tr,
    isDialog: true,
    lottieAnim: '',
    negativeText: LocaleKeys.noThanks.tr,
    positiveText: LocaleKeys.logout.tr,
    onTap: () async {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
        await Get.find<SharedPreferenceService>().clearData();
        // Get.offAllNamed(ProfileMenuEnum.logoutMenu.route);
        Logger.write('==============**Clear Data**===============');
      });
    },
  );
}

void sessionExpiredDialog() {
  showCommonDialog(
    title: LocaleKeys.sessionExpired.tr,
    message: LocaleKeys.sessionExpiredDesc.tr,
    isDialog: true,
    lottieAnim: '',
    positiveText: LocaleKeys.loginAgain.tr,
    repeat: true,
    onTap: () {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
        Get.find<SharedPreferenceService>().clearData();
        // Get.offAllNamed(ProfileMenuEnum.logoutMenu.route);
        Logger.write('==============**Clear Data**===============');
      });
    },
  );
}

void deepLinkResetPasswordDialog() {
  // showCommonDialog(
  //   title: LocaleKeys.resetPassword.tr,
  //   message: LocaleKeys.resetPasswordDesc.tr,
  //   isDialog: true,
  //   lottieAnim: AnimPath.animSessionExpired,
  //   positiveText: LocaleKeys.login.tr,
  //   repeat: true,
  //   onTap: () {
  //     FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  //     Get.find<SharedPreferenceService>().clearData();
  //     firebaseAuth.signOut().whenComplete(() =>
  //     Get.offAllNamed(Routes.LOGIN,),);
  //     Logger.write('==============**Clear Data**===============');
  //   },
  // );
}

Future<BigPictureStyleInformation> getBigPictureStyle(String url) async {
  var res = await http.get(Uri.parse(url));
  return BigPictureStyleInformation(
    ByteArrayAndroidBitmap.fromBase64String(base64Encode(res.bodyBytes)),
  );
}

Future<String> getBigPictureStyleIos(String url) async {
  var res = await http.get(Uri.parse(url));
  // Get temporary directory
  var dir = await getTemporaryDirectory();

  // Create an image name
  var filename = '${dir.path}/${DateTime.now().millisecondsSinceEpoch}.png';

  // Save to filesystem
  var file = File(filename);
  await file.writeAsBytes(res.bodyBytes);
  return file.absolute.path;
}

Future<dynamic> showCommonDialog({
  required String message,
  String? lottieAnim,
  String? title,
  Function? onTap,
  String? positiveText,
  String? negativeText,
  Function? onNegativeTap,
  bool? isDialog,
  TextAlign textAlign = TextAlign.left,
  VoidCallback? onClose,
  bool shouldClose = true,
  double? animHeight,
  bool repeat = false,
}) {
  if (Get.isDialogOpen ?? false) {
    Logger.write('dialog is already open');
    return Future.value();
  }
  return Get.dialog(
    CustomAnimDialog(
      lottieAnimPath: lottieAnim ?? '',
      textAlign: textAlign,
      onTap: onTap,
      message: message,
      negativeText: negativeText,
      onNegativeTap: onNegativeTap,
      positiveText: positiveText,
      title: title ?? '',
      repeat: repeat,
      isDismissible: shouldClose,
      animHeight: animHeight,
    ),
    name: 'common-dialog',
    barrierDismissible: shouldClose,
  );
}

Future<dynamic> showCommonBottomSheet({
  required Widget child,
  bool? isScrollControlled,
  bool? isDismissible,
  bool? enableDrag,
  RouteSettings? routeSettings,
}) {
  return Get.bottomSheet(
    child,
    isScrollControlled: isScrollControlled ?? true,
    isDismissible: isDismissible ?? false,
    enableDrag: enableDrag ?? false,
    settings: routeSettings,
  ).whenComplete(() => debugPrint('close'));
}

BoxDecoration commonBgGradiantColor() {
  return BoxDecoration(
    gradient: RadialGradient(
      center: const Alignment(0, -0.8),
      colors: [
        Get.theme.colorScheme.primary.withOpacity(0.12),
        Get.theme.colorScheme.primary.withOpacity(0),
      ],
      radius: 1.5,
    ),
  );
}

BoxShadow commonShadow() {
  return BoxShadow(
    color: Get.theme.colorScheme.primaryContainer.withOpacity(0.05),
    blurRadius: 26.r,
    offset: Offset(0, 7.h),
  );
}

BoxDecoration commonBoxDecoration({
  Color? bgColor,
  Color? borderColor,
  BorderRadius? borderRadiusAll,
  double? borderRadius,
}) {
  return BoxDecoration(
    color: bgColor ?? Get.theme.colorScheme.surface,
    borderRadius: borderRadiusAll ?? BorderRadius.circular(borderRadius ?? 10.h),
    border: Border.all(
      color: borderColor ?? Get.theme.colorScheme.outline,
    ),
  );
}

Border commonBorder({Color? color, double? width}) {
  return Border.all(
    width: width ?? 1.5.w,
    color: color ?? Get.theme.colorScheme.primaryContainer.withOpacity(0.10),
  );
}

void displaySnackBar(String title, String message, {bool isSuccess = true}) {
  Logger.write('we are showing snack with $title $message');

  Get.snackbar(
    title,
    message,
    titleText: Text(
      title,
      style: Get.context!.textTheme.labelMedium?.copyWith(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: Get.context!.theme.scaffoldBackgroundColor,
        height: 1,
      ),
    ),
    messageText: Text(
      message,
      style: Get.context!.textTheme.labelSmall?.copyWith(
        fontSize: 16.sp,
        color: Get.context!.theme.scaffoldBackgroundColor,
      ),
    ),
    backgroundColor:
        (isSuccess) ? Get.theme.colorScheme.primary : Get.theme.colorScheme.primary,
    isDismissible: true,
    snackPosition: SnackPosition.BOTTOM,
    shouldIconPulse: true,
    borderRadius: 15.r,
    icon: Icon(
      (isSuccess) ? Icons.check_circle : Icons.warning_rounded,
      color: Get.context!.theme.colorScheme.surface,
    ),
    animationDuration: const Duration(milliseconds: 500),
    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
    margin: EdgeInsets.fromLTRB(20.w, 0, 20.w, 20.h),
  );
}

Container commonDivider({double? height, double? width, Color? color}) {
  return Container(
    width: width ?? Get.width,
    height: height ?? 1.h,
    color: color ?? Get.theme.colorScheme.outline,
  );
}

String getFormattedDate(String inputDate, {bool isUTC = false}) {
  DateTime dateTime = DateTime.parse(inputDate);
  if (isUTC) {
    dateTime = dateTime.toLocal();
  }
/*var suffix = 'th';
  var digit = dateTime.day % 10;
  if ((digit > 0 && digit < 4) && (dateTime.day < 11 || dateTime.day > 13)) {
    suffix = ['st', 'nd', 'rd'][digit - 1];
  }*/
  DateFormat outputFormat = DateFormat('dd-MMM-yyyy HH:mm a');
  return outputFormat.format(dateTime);
}

String getFormattedTime(String inputDate, {bool isUTC = false}) {
  DateTime dateTime = DateTime.parse(inputDate);
  if (isUTC) {
    dateTime = dateTime.toLocal();
  }
/*var suffix = 'th';
  var digit = dateTime.day % 10;
  if ((digit > 0 && digit < 4) && (dateTime.day < 11 || dateTime.day > 13)) {
    suffix = ['st', 'nd', 'rd'][digit - 1];
  }*/
  DateFormat outputFormat = DateFormat('HH:mm a');
  return outputFormat.format(dateTime);
}

String getShortName(String fullName) {
  String shortName = '';
  try {
    List<String> words = fullName.split(' ');

    List<String> firstCharacters = words.map((word) {
      if (word.isNotEmpty) {
        return word[0];
      }
      return '';
    }).toList();

    shortName = firstCharacters.join();
  } catch (e) {
    Logger.write('Error in Shorting name : $fullName');
  }
  return shortName.toUpperCase();
}

JsonParser<T?> tryParser<T>(JsonParser<T> parser) {
  return (Map<String, dynamic> json) {
    try {
      return parser(json);
    } catch (e, s) {
      debugPrint(s.toString());
      return null;
    }
  };
}

extension StringExtension on String? {
  bool get isNullOrEmpty {
    return this == null || this!.isEmpty;
  }

  bool get isNotNullAndEmpty {
    return this != null || this!.isNotEmpty;
  }
}

extension ListExtension on List? {
  bool get isNullOrEmpty {
    return this == null || this!.isEmpty;
  }

  bool get isNotNullButEmpty {
    return this != null && this!.isEmpty;
  }

  bool get isNotNullAndEmpty {
    return this != null && this!.isNotEmpty;
  }
}

extension ObjectExtension on Object? {
  bool get isNull {
    return this == null;
  }

  bool get isNotNull {
    return this != null;
  }
}

T? tryParseJsonObject<T>(Function fun) {
  try {
    return fun.call();
  } catch (e, s) {
    debugPrint(s.toString());
    debugPrint(e.toString());
    return null;
  }
}

List<T> tryParseList<T>(
  List<dynamic> list,
  T? Function(Map<String, dynamic> map) parse,
) {
  return list
      .whereType<Map<String, dynamic>>()
      .map((data) {
        try {
          return parse.call(data);
        } catch (e) {
          debugPrint('Ohhh Error in Mapping ->----------------------<-');
          debugPrint('Error Message : $e');

          return null;
        }
      })
      .whereType<T>()
      .toList();
}

/*Future<void> initPayment() async {
  await FlutterCheckoutPayment.init(
    key: checkoutPaymentPublicKey,
  );
}

Future<CardTokenisationResponse> saveCard(
  String cardNumber,
  String name,
  String expiryMonth,
  String expiryYear,
  String cvv,
) async {
  CardTokenisationResponse? response = await FlutterCheckoutPayment.generateToken(
    number: cardNumber,
    name: name,
    expiryMonth: expiryMonth,
    expiryYear: expiryYear,
    cvv: cvv,
  );
  debugPrint("::::402${response?.token ?? ''}");
  return response ?? CardTokenisationResponse();
}*/

extension E on String {
  String lastChars(int n) => substring(length - n);
}

extension S on String {
  String startChars(int n) => substring(0, n);
}

extension DateConversion on String {
  String convertToFormattedDate() {
    try {
      DateTime dateTime = DateTime.parse(this).toLocal();
      return DateFormat('MMM dd y').format(dateTime);
    } catch (e) {
      return this; // Return the original string if parsing fails
    }
  }

  String chatDate() {
    try {
      DateTime dateTime = DateTime.parse(this).toLocal();
      return DateFormat('MMM dd y hh:mm a').format(dateTime);
    } catch (e) {
      return this; // Return the original string if parsing fails
    }
  }
}
