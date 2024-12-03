import 'dart:developer';

import 'package:flutter/foundation.dart';

class Logger {
  // Sample of abstract logging function
  static void write(String text, {bool isError = false}) {
    Future.microtask(() {
      !kDebugMode
          ? debugPrint('** $text. isError: [$isError]')
          : log('** $text. isError: [$isError]');
    });
  }
}
