import 'package:flutter/material.dart';
import 'package:qr_scanner/components/custom_elevated_button.dart';
import 'package:qr_scanner/const.dart';
import 'package:qr_scanner/size_config.dart';
import 'package:qr_scanner/view/scanner/scanner_view.dart';
import 'package:qr_scanner/view/welcome/components/welcome_text.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});
  static String routeName = "/welcome_view";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        height: SizeConfig.screenHeight!,
        width: SizeConfig.screenWidth!,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              lightBlueColor,
              whiteColor,
            ],
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight! * 0.07),
            Image.asset("assets/images/qr code.png"),
            // welcome text
            SizedBox(height: SizeConfig.screenHeight! * 0.07),
            const WelcomeText(),

            // elevated button
            SizedBox(height: SizeConfig.screenHeight! * 0.3),
            CustomElevatedButton(
              title: "Scan Now",
              icon: Icons.qr_code_2,
              onPress: () {
                // navigate to scanner screen
                Navigator.pushNamed(context, ScannerView.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
