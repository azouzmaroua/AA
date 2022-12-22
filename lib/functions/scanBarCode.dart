import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

Future scanBarCode() async {
  String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
      '#FFFFFF', 'Cancel', true, ScanMode.BARCODE);
  return barcodeScanRes;
}
