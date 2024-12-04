import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

const int mobileNumberLength = 10;
const int otpMaxLength = 4;
const int postCodeMaxLength = 6;
const int passwordLength = 6;
const animationDuration = Duration(milliseconds: 200);
const int maxPrescriptionImageUpload = 3;
const String countryCode = '+44';
const String currencyCode = '\$';
const int maxQuantityAllow = 9;
const int defaultHttpStatusCode = 500;
RxInt unReadCount = 0.obs;
const double maxImageWidth = 500;
const int maxImageQuality = 100;
PhoneNumber initialCountryCode = PhoneNumber(isoCode: 'US');
const introSliderInterval = Duration(seconds: 4);
const introSliderPageAnimateDuration = Duration(milliseconds: 500);
const checkoutPaymentPublicKey = 'pk_sbox_3jvelfyxabwnstlfo457dtym5aw';
const String perPage = '10';

const mobileValidationRegEx = r'^[6-9]\d{9}$';
const nameValidationRegEx = r'(^[a-zA-Z ]*$)';
const postCodeValidationRegEx = r'(^[0-9]*$)';
const emailValidationRegEx =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
