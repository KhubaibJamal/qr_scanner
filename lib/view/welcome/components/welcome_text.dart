import 'package:flutter/material.dart';
import 'package:qr_scanner/size_config.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "Welcome to\n QR Code Scanner",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: getProportionateScreenWidth(35),
      ),
    );
  }
}
