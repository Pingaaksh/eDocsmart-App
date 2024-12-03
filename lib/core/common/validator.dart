import 'package:get/get.dart';
import 'package:skin_match/core/common/app_common_exports.dart';

mixin Validator {
  String? emptyValidate(String value, String key) => (value.trim().isEmpty) ? '$key ${LocaleKeys.mustNotEmpty.tr}' : null;

  String? addressCheckValidation(String value, String message) => (value.trim().isEmpty) ? message : null;

  String? validatePhone(String value) {
    String pattern = mobileValidationRegEx;
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return LocaleKeys.pleaseEnterPhoneNumber.tr;
    } else if (value.length != mobileNumberLength) {
      return '${LocaleKeys.phoneNumber.tr} ${LocaleKeys.mustBe.tr} $mobileNumberLength ${LocaleKeys.digits.tr}.';
    } else if (!regExp.hasMatch(value)) {
      return LocaleKeys.errValidPhoneNumber.tr;
    }
    return null;
  }

  String? validateName(String value, String key) {
    value = value.trim();

    // String pattern = nameValidationRegEx;
    // RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return '$key ${LocaleKeys.mustNotEmpty.tr}';
    }
    /*else if (!regExp.hasMatch(value)) {
      return '$key $containsCharacters';
    }*/
    return null;
  }

  String? validateMobile(String value) {
    value = value.trim();

    String pattern = mobileValidationRegEx;
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return '${LocaleKeys.phoneNumber.tr} ${LocaleKeys.mustNotEmpty.tr}';
    } else if (value.length != mobileNumberLength) {
      return '${LocaleKeys.phoneNumber.tr} ${LocaleKeys.mustBe.tr} $mobileNumberLength ${LocaleKeys.digits.tr}.';
    } else if (!regExp.hasMatch(value)) {
      return LocaleKeys.errValidPhoneNumber.tr;
    }
    return null;
  }

  String? validatePostCode(String value) {
    value = value.trim();

    String pattern = postCodeValidationRegEx;
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return '${LocaleKeys.pinCode.tr} ${LocaleKeys.mustNotEmpty.tr}';
    } else if (value.length != postCodeMaxLength) {
      return '${LocaleKeys.pinCode.tr} ${LocaleKeys.mustBe.tr} $postCodeMaxLength ${LocaleKeys.digits.tr}.';
    } else if (!regExp.hasMatch(value)) {
      return LocaleKeys.errEnterValidPinCode.tr;
    }
    return null;
  }

  String? validateOTP(String value) {
    value = value.trim();

    if (value.isEmpty) {
      return '${LocaleKeys.otp.tr} ${LocaleKeys.mustNotEmpty.tr}';
    } else if (value.length != otpMaxLength) {
      return '${LocaleKeys.otp.tr} ${LocaleKeys.mustBe.tr} $otpMaxLength ${LocaleKeys.digits.tr}.';
    }
    return null;
  }

  bool isEmail(String input) => (validateEmail(input) ?? '').isEmpty;

  bool isPhone(String input) => RegExp(mobileValidationRegEx).hasMatch(input);

  String? validateEmailOrPhone(String value) {
    value = value.trim();
    if (value.isEmpty) {
      return '${LocaleKeys.phoneOrEmail.tr} ${LocaleKeys.mustNotEmpty.tr}';
    } else if (isEmail(value)) {
      return validateEmail(value);
    } else if (!isPhone(value)) {
      return LocaleKeys.phoneOrEmailError.tr;
    }
    return null;
  }

  String? validateEmail(String value) {
    value = value.trim();

    String pattern = emailValidationRegEx;
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return '${LocaleKeys.emailAddress.tr} ${LocaleKeys.mustNotEmpty.tr}';
    } else if (!regExp.hasMatch(value)) {
      return LocaleKeys.errValidEmail.tr;
    }
    return null;
  }

  String? validatePassword(String? value) => (value?.trim().isEmpty ?? true)
      ? '${LocaleKeys.password.tr} ${LocaleKeys.mustNotEmpty.tr}'
      : (value!.trim().length < passwordLength)
          ? '${LocaleKeys.password.tr} ${LocaleKeys.mustBe.tr} $passwordLength ${LocaleKeys.digits.tr}'
          : null;

    String? confirmPasswordValidate(
    String newPassword,
    String confirmPassword,
    String key,
  ) {
    if (confirmPassword.trim().isEmpty) {
      return '$key ${LocaleKeys.mustNotEmpty.tr}';
    } else if (newPassword.trim().compareTo(confirmPassword.trim()) != 0) {
      return LocaleKeys.passwordNotMatched.tr;
    }
    return null;
  }


  String? validateCVV(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    if (value.length < 3 || value.length > 4) {
      return 'CVV is invalid';
    }
    return null;
  }

  String? validateDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    int year;
    int month;
    if (value.contains(RegExp(r'(/)'))) {
      var split = value.split(RegExp(r'(/)'));

      month = int.parse(split[0]);
      year = int.parse(split[1]);
    } else {
      month = int.parse(value.substring(0, (value.length)));
      year = -1; // Lets use an invalid year intentionally
    }
    if ((month < 1) || (month > 12)) {
      // A valid month is between 1 (January) and 12 (December)
      return 'Expiry month is invalid';
    }
    var fourDigitsYear = convertYearTo4Digits(year);
    if ((fourDigitsYear < 1) || (fourDigitsYear > 2099)) {
      // We are assuming a valid should be between 1 and 2099.
      // Note that, it's valid doesn't mean that it has not expired.
      return 'Expiry year is invalid';
    }
    if (!hasDateExpired(month, year)) {
      return 'Card has expired';
    }
    return null;
  }

  int convertYearTo4Digits(int year) {
    if (year < 100 && year >= 0) {
      var now = DateTime.now();
      String currentYear = now.year.toString();
      String prefix = currentYear.substring(0, currentYear.length - 2);
      year = int.parse('$prefix${year.toString().padLeft(2, '0')}');
    }
    return year;
  }

  bool hasDateExpired(int month, int year) {
    return isNotExpired(year, month);
  }

  bool isNotExpired(int year, int month) {
    // It has not expired if both the year and date has not passed
    return !hasYearPassed(year) && !hasMonthPassed(year, month);
  }

  bool hasMonthPassed(int year, int month) {
    var now = DateTime.now();
    // The month has passed if:
    // 1. The year is in the past. In that case, we just assume that the month
    // has passed
    // 2. Card's month (plus another month) is more than current month.
    return hasYearPassed(year) || convertYearTo4Digits(year) == now.year && (month < now.month + 1);
  }

  bool hasYearPassed(int year) {
    int fourDigitsYear = convertYearTo4Digits(year);
    var now = DateTime.now();
    // The year has passed if the year we are currently is more than card's
    // year
    return fourDigitsYear < now.year;
  }
}
