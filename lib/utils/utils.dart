import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:qr_scanner/const.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  // launch http url
  static Future<void> launchURL(String url, BuildContext context) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      flushBarMessage("Could not launch", context);
    }
  }

  // flush bar message
  static void flushBarMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        message: message,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        icon: const Icon(Icons.copy, size: 30, color: Colors.white),
        backgroundColor: blueColor,
        isDismissible: true,
        borderRadius: BorderRadius.circular(30),
        dismissDirection: FlushbarDismissDirection.HORIZONTAL,
        flushbarPosition: FlushbarPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        reverseAnimationCurve: Curves.easeInOut,
        forwardAnimationCurve: Curves.decelerate,
      )..show(context),
    );
  }
}
