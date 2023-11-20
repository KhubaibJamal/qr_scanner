import 'package:flutter/material.dart';
import 'package:qr_scanner/const.dart';
import 'package:qr_scanner/size_config.dart';

class CustomElevatedButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function() onPress;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderWidth;
  final double? buttonHeight;
  final double? buttonWidth;
  final Color? iconAndTextColor;

  const CustomElevatedButton({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.backgroundColor = Colors.blue,
    this.borderColor = Colors.blue,
    this.borderWidth = 1.5,
    this.buttonWidth = 200,
    this.buttonHeight = 50,
    this.iconAndTextColor = whiteColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        side: BorderSide(color: borderColor!, width: borderWidth!),
        // size of button
        fixedSize: Size(
          getProportionateScreenWidth(buttonWidth!),
          getProportionateScreenWidth(buttonHeight!),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      icon: Icon(
        icon,
        color: iconAndTextColor,
        size: getProportionateScreenWidth(25),
      ),
      label: Text(
        title,
        style: TextStyle(
          color: iconAndTextColor,
          fontSize: getProportionateScreenWidth(25),
        ),
      ),
    );
  }
}
