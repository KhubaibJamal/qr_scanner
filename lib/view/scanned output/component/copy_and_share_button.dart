import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_scanner/components/custom_elevated_button.dart';
import 'package:qr_scanner/const.dart';

class CopyAndShareButton extends StatelessWidget {
  const CopyAndShareButton({
    super.key,
    required this.copyText,
  });

  final String copyText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomElevatedButton(
          title: "Copy",
          icon: Icons.copy,
          backgroundColor: whiteColor,
          iconAndTextColor: Colors.black,
          buttonWidth: 150,
          onPress: () {
            // copy text in clipboard
            Clipboard.setData(ClipboardData(text: copyText));
          },
        ),
        CustomElevatedButton(
          title: "share",
          icon: Icons.share,
          backgroundColor: whiteColor,
          iconAndTextColor: Colors.black,
          buttonWidth: 150,
          onPress: () {},
        ),
      ],
    );
  }
}
