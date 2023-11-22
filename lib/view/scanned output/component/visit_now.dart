import 'package:flutter/material.dart';
import 'package:qr_scanner/components/custom_elevated_button.dart';
import 'package:url_launcher/link.dart';

class VisitNow extends StatelessWidget {
  const VisitNow({
    super.key,
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return Link(
      uri: Uri.parse(url),
      builder: (context, followLink) {
        return CustomElevatedButton(
          title: "Visit Now",
          icon: Icons.open_in_new,
          onPress: followLink!,
        );
      },
    );
  }
}
