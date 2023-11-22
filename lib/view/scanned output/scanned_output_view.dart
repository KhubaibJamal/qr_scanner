import 'package:flutter/material.dart';
import 'package:qr_scanner/const.dart';
import 'package:qr_scanner/size_config.dart';
import 'package:qr_scanner/view/scanned%20output/component/copy_and_share_button.dart';
import 'package:qr_scanner/view/scanned%20output/component/output_container.dart';
import 'package:qr_scanner/view/scanned%20output/component/visit_now.dart';
import 'package:qr_scanner/view/welcome/welcome_view.dart';

class ScannedOutputView extends StatelessWidget {
  const ScannedOutputView({super.key});
  static String routeName = "/scanned_output";

  @override
  Widget build(BuildContext context) {
    final CodeOutput arg =
        ModalRoute.of(context)!.settings.arguments as CodeOutput;
    return Container(
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
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Scanned Output"),
          leading: IconButton(
            onPressed: () {
              arg.onScreenChange;
              Navigator.popAndPushNamed(context, WelcomeView.routeName);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: getProportionateScreenWidth(30),
            ),
          ),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(getProportionateScreenWidth(15)),
            child: Column(
              children: [
                Image.asset("assets/images/qr code.png"),

                // text box
                SizedBox(height: getProportionateScreenWidth(20)),
                OutputContainer(output: arg.code),

                // copy and share button
                SizedBox(height: SizeConfig.screenHeight! * 0.03),
                CopyAndShareButton(copyText: arg.code),

                // Visit now btn
                SizedBox(height: SizeConfig.screenHeight! * 0.03),
                VisitNow(url: arg.code),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CodeOutput {
  final String code;
  final Function onScreenChange;
  CodeOutput({required this.code, required this.onScreenChange});
}
