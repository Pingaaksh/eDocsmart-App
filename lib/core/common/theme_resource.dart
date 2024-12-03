// ignore_for_file: deprecated_member_use

import 'package:get/get.dart';
import 'package:skin_match/core/common/app_common_exports.dart';
import 'package:skin_match/core/enum/theme_type.dart';

class ThemeResource {
  static var fontType = getFontFamilyType(FontFamilyType.productSansBold);

  double get expectedDeviceWidth => 393;

  double get expectedDeviceHeight => 852;

  ThemeMode? themeMode;

  SharedPreferenceService sharedPreference = SharedPreferenceService();

  //DarkTheme
  //TODO: change your dark theme according to your Ui
  final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: DarkThemeColors.backgroundColor,
    brightness: Brightness.dark,
    primaryColor: DarkThemeColors.primaryColor,
    secondaryHeaderColor: DarkThemeColors.primaryColor.withOpacity(0.20),
    dividerColor: DarkThemeColors.dividerColor,
    fontFamily: fontType,
    // border color
    buttonTheme: ButtonThemeData(
      buttonColor: DarkThemeColors.primaryColor,
      disabledColor: DarkThemeColors.textDisabled,
      focusColor: DarkThemeColors.secondaryColor,
    ),
    tabBarTheme: TabBarTheme(
      dividerColor: DarkThemeColors.textDisabled,
      labelColor: DarkThemeColors.secondaryColor,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorColor: DarkThemeColors.secondaryColor,
      unselectedLabelColor: DarkThemeColors.primaryColor,
    ),
    textTheme: TextTheme(
      titleMedium: const TextStyle(
        letterSpacing: 0,
        fontWeight: FontWeight.w500,
      ),
      labelLarge: TextStyle(
        letterSpacing: 0,
        fontWeight: FontWeight.bold, //BOLD
        color: DarkThemeColors.textPrimary,
      ),
      labelMedium: TextStyle(
        letterSpacing: 0,
        fontWeight: FontWeight.w500, //MEDIUM
        color: DarkThemeColors.textPrimary,
      ),
      labelSmall: TextStyle(
        letterSpacing: 0,
        fontWeight: FontWeight.normal, //NORMAL
        color: DarkThemeColors.textPrimary,
      ),
      bodyMedium: TextStyle(
        letterSpacing: 0,
        fontWeight: FontWeight.w600,
        //SEMI BOLD
        color: DarkThemeColors.textPrimary,
        height: 1.3,
      ),
      bodyLarge: TextStyle(
        letterSpacing: 0,
        fontWeight: FontWeight.w500, //BOLD
        color: DarkThemeColors.textPrimary,
      ),
      titleSmall: TextStyle(
        letterSpacing: 0,
        fontWeight: FontWeight.normal, //NORMAL
        color: DarkThemeColors.textPrimary,
      ),
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: DarkThemeColors.primaryColor,
      onSecondary: DarkThemeColors.secondaryColor.withOpacity(0.80),
      onError: DarkThemeColors.errorColor.withOpacity(0.80),
      onPrimary: DarkThemeColors.primaryColor.withOpacity(0.80),
      background: DarkThemeColors.backgroundColor,
      surface: DarkThemeColors.backgroundColor,
      secondary: DarkThemeColors.secondaryColor,
      error: DarkThemeColors.errorColor,
      onBackground: DarkThemeColors.backgroundColor.withOpacity(0.80),
      onSurface: DarkThemeColors.backgroundColor.withOpacity(0.80),
      primaryContainer: DarkThemeColors.textPrimary,
      secondaryContainer: DarkThemeColors.textSecondary,
      onTertiaryContainer: DarkThemeColors.textDisabled,
      outline: DarkThemeColors.dividerColor,
      surfaceTint: DarkThemeColors.themeLightCode,
    ).copyWith(background: DarkThemeColors.backgroundColor),
  );

  //Light Theme
  //TODO: change your light theme according to your Ui
  final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: LightThemeColors.whiteColor,
    brightness: Brightness.light,
    primaryColor: LightThemeColors.primaryColor,
    secondaryHeaderColor: LightThemeColors.primaryColor.withOpacity(0.20),
    dividerColor: LightThemeColors.dividerColor,
    fontFamily: fontType,
    tabBarTheme: TabBarTheme(
      dividerColor: LightThemeColors.textDisabled,
      labelColor: LightThemeColors.secondaryColor,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorColor: LightThemeColors.secondaryColor,
      unselectedLabelColor: LightThemeColors.primaryColor,
    ),
    // border color
    buttonTheme: ButtonThemeData(
      buttonColor: LightThemeColors.primaryColor,
      disabledColor: LightThemeColors.textDisabled,
      focusColor: LightThemeColors.secondaryColor,
    ),
    listTileTheme: ListTileThemeData(
      textColor: LightThemeColors.textPrimary,
      titleTextStyle: TextStyle(
        fontSize: 14,
        color: LightThemeColors.primaryColor,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      subtitleTextStyle: TextStyle(
        color: LightThemeColors.textSecondary,
        fontSize: 22,
        fontWeight: FontWeight.w600,
      ),
      leadingAndTrailingTextStyle: TextStyle(
        fontSize: 14,
        color: LightThemeColors.primaryColor,
      ),
    ),
    textTheme: TextTheme(
      titleMedium: TextStyle(
        letterSpacing: 0,
        fontWeight: FontWeight.w500,
        decorationColor: LightThemeColors.primaryColor,
      ),
      labelLarge: TextStyle(
        letterSpacing: 0,
        fontWeight: FontWeight.bold, //BOLD
        color: LightThemeColors.textPrimary,
        decorationColor: LightThemeColors.primaryColor,
      ),
      labelMedium: TextStyle(
        letterSpacing: 0,
        fontWeight: FontWeight.w500, //MEDIUM
        color: LightThemeColors.textPrimary,
        fontFamily: FontFamilyType.poppins.name ,
        decorationColor: LightThemeColors.primaryColor,
      ),
      labelSmall: TextStyle(
        letterSpacing: 0,
        fontWeight: FontWeight.normal, //NORMAL
        color: LightThemeColors.textPrimary,
        decorationColor: LightThemeColors.secondaryColor,
      ),
      bodyMedium: TextStyle(
        letterSpacing: 0,
        fontWeight: FontWeight.w600,
        //SEMI BOLD
        color: LightThemeColors.textPrimary,
        decorationColor: LightThemeColors.primaryColor,
        fontSize: 16,
        height: 1.3,
      ),
      bodyLarge: TextStyle(
        letterSpacing: 0,
        fontWeight: FontWeight.w500, //BOLD
        color: LightThemeColors.textPrimary,
        decorationColor: LightThemeColors.primaryColor,
      ),
      titleSmall: TextStyle(
        letterSpacing: 0,
        fontWeight: FontWeight.normal, //NORMAL
        color: LightThemeColors.textPrimary,
        decorationColor: LightThemeColors.primaryColor,
      ),
    ),

    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: LightThemeColors.primaryColor,
      onSecondary: LightThemeColors.secondaryColor.withOpacity(0.80),
      onError: LightThemeColors.errorColor.withOpacity(0.80),
      onPrimary: LightThemeColors.primaryColor.withOpacity(0.80),
      background: LightThemeColors.backgroundColor,
      surface: LightThemeColors.whiteColor,
      secondary: LightThemeColors.secondaryColor,
      error: LightThemeColors.errorColor,
      onBackground: LightThemeColors.backgroundColor.withOpacity(0.80),
      onSurface: LightThemeColors.secondaryColor,
      primaryContainer: LightThemeColors.textPrimary,
      secondaryContainer: LightThemeColors.textSecondary,
      onTertiaryContainer: LightThemeColors.textDisabled,
      outline: LightThemeColors.dividerColor,
      surfaceTint: LightThemeColors.themeLightCode,
      surfaceVariant: LightThemeColors.cardBoxColor,
      onPrimaryContainer: LightThemeColors.successColor,
    ),
  );

  /// Get Current selected Theme
  /// Get Current Selected Theme From Shared Preference
  /// return Object of Theme Mode
  Future<ThemeMode> getSelectedThemeMode() async {
    await sharedPreference.init();
    ThemeMode themeMode = await sharedPreference.getThemeMode();
    ThemeResource().changeThemeMode(themeMode);
    debugPrint(
      'Current Theme: ${ThemeResource().themeMode.toString().toLowerCase()}',
    );
    return themeMode;
  }

  /// Change the Theme Selected by User
  ///  theme : Theme Mode [ex : Theme.dark, Theme.light, Theme.system]
  void changeThemeMode(ThemeMode theme) async {
    debugPrint('Change Theme : $theme');
    themeMode = theme;
    await sharedPreference.init();
    await sharedPreference.setThemeMode(theme);
    Get.changeThemeMode(theme);
    // debugPrint('Current Theme : ${themeMode.value}');
  }

  /// Change Theme Common Icon
  /// return Widget
  /*Widget themeSelectionIcon(
    BuildContext context, {
    IconData? icon,
    Color? color,
  }) {
    return InkWell(
      onTap: () => openBottomSheet(context),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Icon(
          icon ?? Icons.more_vert,
          color: color ?? Theme.of(context).colorScheme.primaryContainer,
        ),
      ),
    );
  }*/

  /// Open Bottom sheet
  /// Show Change Theme Bottom Sheet
  ///
  /*void openBottomSheet(BuildContext context) {
    getCurrentThemeMode().then((value) {
      Get.bottomSheet(
        SizedBox(
          height: 200.0,
          child: ChangeTheme(themeMode: value),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
      );
    });
  }*/

  /// Get Current Selected Theme
  /// return Current Theme Mode
  Future<String> getCurrentThemeMode() async {
    debugPrint('Theme Mode : $themeMode');
    var currentTheme = await getSelectedThemeMode();
    if (currentTheme == ThemeMode.dark) {
      return EThemeType.dark.themeName;
    } else if (currentTheme == ThemeMode.light) {
      return EThemeType.light.themeName;
    } else {
      return EThemeType.system.themeName;
    }
  }
}
