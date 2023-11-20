import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_scanner/const.dart';
import 'package:qr_scanner/size_config.dart';
import 'package:qr_scanner/view/scanned%20output/scanned_output_view.dart';
import 'package:qr_scanner_overlay/qr_scanner_overlay.dart';

class ScannerView extends StatefulWidget {
  const ScannerView({super.key});
  static String routeName = "/scanner_view";

  @override
  State<ScannerView> createState() => _ScannerViewState();
}

class _ScannerViewState extends State<ScannerView> {
  bool isScanCompletes = false;

  late MobileScannerController cameraController;

  @override
  void initState() {
    super.initState();
    cameraController = MobileScannerController(
      detectionSpeed: DetectionSpeed.normal,
      facing: CameraFacing.back,
    );
  }

  @override
  void dispose() {
    super.dispose();
    cameraController.dispose();
  }

  void closeScreen() {
    isScanCompletes = false;
  }

  @override
  Widget build(BuildContext context) {
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
          title: const Text("Scan QR Code"),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: getProportionateScreenWidth(30),
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: SizeConfig.screenHeight! * 0.06),
              Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    MobileScanner(
                      controller: cameraController,
                      onDetect: (capture) {
                        final List<Barcode> barcodes = capture.barcodes;
                        // final Uint8List? image = capture.image;
                        for (final barcode in barcodes) {
                          // debugPrint('Barcode found! ${barcode.rawValue}');

                          if (!isScanCompletes) {
                            String? code = barcode.rawValue;
                            isScanCompletes = true;
                            print(code);
                            Navigator.pushNamed(
                                context, ScannedOutputView.routeName);
                            // break;
                          }
                        }
                      },
                    ),
                    QRScannerOverlay(),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {
                          cameraController.torchEnabled;
                        },
                        icon: Icon(
                          Icons.flash_on,
                          size: getProportionateScreenWidth(30),
                        )),
                    IconButton(
                        onPressed: () {
                          cameraController.switchCamera();
                        },
                        icon: Icon(
                          Icons.cameraswitch_sharp,
                          size: getProportionateScreenWidth(30),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
