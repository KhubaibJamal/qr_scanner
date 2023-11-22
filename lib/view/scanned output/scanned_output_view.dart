import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_scanner/components/custom_elevated_button.dart';
import 'package:qr_scanner/const.dart';
import 'package:qr_scanner/size_config.dart';
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
                Container(
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
                    arg.code,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(15),
                    ),
                  ),
                ),

                // copy and share button
                SizedBox(height: SizeConfig.screenHeight! * 0.03),
                Row(
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
                        Clipboard.setData(ClipboardData(text: arg.code));
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
                ),

                // Visit now btn
                SizedBox(height: SizeConfig.screenHeight! * 0.03),
                CustomElevatedButton(
                  title: "Visit Now",
                  icon: Icons.open_in_new,
                  onPress: () {},
                ),
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
