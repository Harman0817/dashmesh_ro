import 'package:flutter/cupertino.dart';

class ROLogger {
  ROLogger._();

  /// This method is used to print the message passed to it in the logcat.
  static void printLog(String msg) {
    debugPrint(msg);
  }

}