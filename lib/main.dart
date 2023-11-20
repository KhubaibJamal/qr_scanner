import 'package:flutter/material.dart';
import 'package:qr_scanner/const.dart';
import 'package:qr_scanner/routes.dart';
import 'package:qr_scanner/view/welcome/welcome_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR Scanner',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: AppBarTheme(
          backgroundColor: lightBlueColor.withOpacity(0.3),
          centerTitle: true,
        ),
        useMaterial3: true,
      ),
      initialRoute: WelcomeView.routeName,
      routes: routes,
    );
  }
}
