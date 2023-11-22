import 'package:flutter/material.dart';
import 'package:qr_scanner/components/custom_elevated_button.dart';
import 'package:qr_scanner/utils/utils.dart';

class VisitNow extends StatelessWidget {
  const VisitNow({
    super.key,
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      title: "Visit Now",
      icon: Icons.open_in_new,
      onPress: () {
        Utils.launchURL(url, context);
      },
    );
  }
}
