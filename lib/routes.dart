import 'package:flutter/material.dart';
import 'package:qr_scanner/view/scanned%20output/scanned_output_view.dart';
import 'package:qr_scanner/view/scanner/scanner_view.dart';
import 'package:qr_scanner/view/welcome/welcome_view.dart';

final Map<String, WidgetBuilder> routes = {
  WelcomeView.routeName: (context) => const WelcomeView(),
  ScannerView.routeName: (context) => const ScannerView(),
  ScannedOutputView.routeName: (context) => const ScannedOutputView(),
};
