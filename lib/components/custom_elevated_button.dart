import 'package:flutter/material.dart';
import 'package:qr_scanner/const.dart';
import 'package:qr_scanner/size_config.dart';

class CustomElevatedButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function() onPress;
  const CustomElevatedButton({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        // size of button
        fixedSize: Size(
          getProportionateScreenWidth(200),
          getProportionateScreenWidth(50),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      icon: Icon(
        icon,
        color: whiteColor,
        size: getProportionateScreenWidth(25),
      ),
      label: Text(
        title,
        style: TextStyle(
          color: whiteColor,
          fontSize: getProportionateScreenWidth(25),
        ),
      ),
    );
  }
}
