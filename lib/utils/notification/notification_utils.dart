import 'dart:developer';

import 'package:bglory_rides/routing/driver_routing.dart';
import 'package:bglory_rides/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart' as fluttertoast;

class NotificationUtil {
  NotificationUtil._();

  static showPositiveNotification(String text) => showSuccessToast(text);
  static showErrorNotification(String text) => showFailureToast(text);

  static fluttertoast.FToast? _fToast;

  static void init() {
    try {
      _fToast = fluttertoast.FToast()
        ..init(
            DriverRouting.router.routerDelegate.navigatorKey.currentContext!);
    } catch (e) {
      log(e.toString());
    }
  }

  static Widget _successToast(String message) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: Colors.green[600],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.check,
              color: Colors.white,
            ),
            const SizedBox(
              width: 12.0,
            ),
            Text(
              message,
              style: white500TextStyle,
            ),
          ],
        ),
      );
  static Widget _failureToast(String message) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: Colors.red,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.error,
              color: Colors.white,
            ),
            const SizedBox(
              width: 12.0,
            ),
            Text(
              message,
              style: white500TextStyle,
            ),
          ],
        ),
      );
  static Widget _infoToast(String message) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: Colors.transparent,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.info),
            const SizedBox(
              width: 12.0,
            ),
            Text(message),
          ],
        ),
      );

  static void showSuccessToast(String message,
      {Duration duration = const Duration(seconds: 2)}) async {
    init();
    if (_fToast == null) {
      showGlobalSuccessToast(message);
    } else {
      await _fToast!.removeQueuedCustomToasts();
      _fToast!.showToast(
        child: _successToast(message),
        toastDuration: duration,
      );
    }
  }

  static void showInfoToast(String message) async {
    init();
    if (_fToast == null) {
      showGlobalInfoToast(message);
    } else {
      await _fToast!.removeQueuedCustomToasts();
      _fToast!.showToast(child: _infoToast(message));
    }
  }

  static void showFailureToast(String message) async {
    init();
    if (_fToast == null) {
      showGlobalFailureToast(message);
    } else {
      await _fToast!.removeQueuedCustomToasts();
      _fToast!.showToast(child: _failureToast(message));
    }
  }

  static void showGlobalFailureToast(String message) {
    fluttertoast.Fluttertoast.showToast(
        msg: message,
        toastLength: fluttertoast.Toast.LENGTH_SHORT,
        gravity: fluttertoast.ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static void showGlobalSuccessToast(String message) {
    fluttertoast.Fluttertoast.showToast(
        msg: message,
        toastLength: fluttertoast.Toast.LENGTH_SHORT,
        gravity: fluttertoast.ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static void showGlobalInfoToast(String message) {
    fluttertoast.Fluttertoast.showToast(
        msg: message,
        toastLength: fluttertoast.Toast.LENGTH_SHORT,
        gravity: fluttertoast.ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey.withOpacity(0.3),
        textColor: Colors.black,
        fontSize: 16.0);
  }
}
