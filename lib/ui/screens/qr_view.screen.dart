import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRViewScreen extends StatefulWidget {
  static const String routeName = '/qr_scanner';

  const QRViewScreen({Key? key}) : super(key: key);

  @override
  State<QRViewScreen> createState() => _QRViewScreenState();
}

class _QRViewScreenState extends State<QRViewScreen> {
  final _qrViewKey = GlobalKey();
  late final QRViewController _qrViewController;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      _qrViewController.pauseCamera();
    } else if (Platform.isIOS) {
      _qrViewController.resumeCamera();
    }
  }

  @override
  void dispose() {
    _qrViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return QRView(
      key: _qrViewKey,
      onQRViewCreated: (QRViewController controller) {
        _qrViewController = controller;
        _qrViewController.scannedDataStream.listen((Barcode barcode) {
          Navigator.pop<Barcode>(context, barcode);
        });
      },
    );
  }
}
