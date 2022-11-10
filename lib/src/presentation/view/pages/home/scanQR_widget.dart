import 'package:riverpod_base/src/presentation/controller/home/tabbar_controller.dart';
import 'package:riverpod_base/src/presentation/view/theme/theme.dart';
import 'package:riverpod_base/src/presentation/view/widgets/widgets.dart';
import 'package:riverpod_base/src/translation/app_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fast_barcode_scanner/fast_barcode_scanner.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScanQRWidget extends ConsumerWidget {
  const ScanQRWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabIndex =  ref.watch(tabBarControllerProvider);
    return Scaffold(
      appBar: AppBarBase(

        // leading: const AppbarButtonBack(),
        middle: AppbarTitle(title: AppLocalization.of(context)!.translate('scan_code')),
      ),
      body: tabIndex == 1 ?  BarcodeCamera(
        types: const [
          BarcodeType.ean8,
          BarcodeType.ean13,
          BarcodeType.code128
        ],
        resolution: Resolution.hd720,
        framerate: Framerate.fps30,
        mode: DetectionMode.pauseVideo,
        onScan: (code){
          print(code);
          // _controller.getTransport(code: code.value);
          CameraController.instance.resumeDetector();
        },
        children: const [
          MaterialPreviewOverlayCustom
            (
            aspectRatio: 1,
          ),
          BlurPreviewOverlay(),
        ],
      ) : Container(
      color: AppColor.content,
      )
    );
  }
}
