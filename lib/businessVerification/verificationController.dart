import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdfLib;
import 'package:path_provider/path_provider.dart';

class VerificationController with ChangeNotifier {
  bool isProcessing = false;

  VerificationController();

  Future<void> verify() async {
    isProcessing = true;
    notifyListeners();
  }

  Future<bool> generatePdf(String path) async {
    try {
      print("Generating PDF....");
      final pdfLib.Document pdf = pdfLib.Document();
      pdf.addPage(
        pdfLib.Page(build: (context) {
          return pdfLib.Center(child: pdfLib.Text("Hello World"));
        }),
      );

      final File file = File(path);
      await file.writeAsBytes(pdf.save());
      return true;
    } catch (err) {
      return false;
    }
  }
}
