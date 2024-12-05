import 'package:firebase_core/firebase_core.dart';
import 'package:skin_match/core/common/app_common_exports.dart';
import 'package:skin_match/core/di/firebase_messaging_manager.dart';
import 'package:skin_match/core/widgets/custom_progress_dialog.dart';
import 'package:skin_match/core/services/translation_service.dart';
import 'package:skin_match/core/global/global_binding.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:skin_match/firebase_options.dart';

String initialRoute = Routes.INIT;

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  HttpOverrides.global = MyHttpOverrides();
  await initServices();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      //<-- For Android SEE HERE (dark icons)
      statusBarBrightness: Brightness.light,
      //<-- For iOS SEE HERE (dark icons)
      statusBarColor: Colors.transparent,
    ),
  );
 // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

Future<void> initServices() async {
  await Get.putAsync(() => ProgressService().init());
  await Get.putAsync(() => SharedPreferenceService().init());
  await Get.putAsync(() => NetworkService().init());
  await Get.putAsync(() => DeviceInfoManager().init());
  Get.put(() => BaseApiProviderImpl().onInit());
  await FirebaseMessagingManager.instance.init();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> with WidgetsBindingObserver {
  // SocketManager socketManager = Get.put(SocketManager.instance);

  @override
  void initState() {
    // Getting current Theme and set to the app
    ThemeResource().getSelectedThemeMode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(
        ThemeResource().expectedDeviceWidth,
        ThemeResource().expectedDeviceHeight,
      ),
      builder: (_, __) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialBinding: GlobalBinding(),
        logWriterCallback: Logger.write,
        initialRoute: initialRoute,
        locale: TranslationService.currentLocale,
        fallbackLocale: TranslationService.currentLocale,
        translationsKeys: TranslationService().keys,
        theme: ThemeResource().lightTheme,
        darkTheme: ThemeResource().lightTheme,
        themeMode: ThemeResource().themeMode ?? ThemeMode.light,
        getPages: AppPages.routes,
        builder: (context, widget) {
          return Obx(() {
            return Stack(
              children: [
                IgnorePointer(
                  ignoring: Get.find<ProgressService>().showProgress.value,
                  child: widget,
                ),
                SafeArea(
                  child: AnimatedContainer(
                    height: Get.find<NetworkService>().isConnectedToInternet.isTrue ? 0 : 50.h,
                    duration: animationDuration,
                    margin: EdgeInsets.only(left: 35.w, right: 35.w, top: 20.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(26.r),
                      color: LightThemeColors.primaryColor,
                    ),
                    child: Material(
                      type: MaterialType.transparency,
                      child: Center(
                        child: Text(
                          LocaleKeys.noInternetConnection.tr,
                          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            fontSize: 14.sp,
                            color: Theme.of(context).colorScheme.surface,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Get.find<ProgressService>().showProgress.isTrue
                    ? const Center(child: CustomProgressDialog())
                    : const Offstage(),
              ],
            );
          });
        },
      ),
    );
  }
}
