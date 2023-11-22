import 'package:flutter/material.dart';
import 'package:qr_scanner/const.dart';
import 'package:qr_scanner/size_config.dart';

class OutputContainer extends StatelessWidget {
  const OutputContainer({super.key, required this.output});
  final String output;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(10),
        vertical: getProportionateScreenWidth(10),
      ),
      height: SizeConfig.screenHeight! / 3.5,
      width: SizeConfig.screenWidth! * 0.9,
      decoration: const BoxDecoration(
        color: whiteColor,
      ),
      child: Text(
        output,
        textAlign: TextAlign.justify,
        style: TextStyle(
          fontSize: getProportionateScreenWidth(15),
        ),
      ),
    );
  }
}
