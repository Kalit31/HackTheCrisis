import 'dart:convert';
import 'dart:io';
import 'package:hackthecause/businessVerification/dataclasses/BusinessDetails.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;

class VerificationController with ChangeNotifier {
  bool isLoading = false;
  bool isDownloaded = false;
  BusinessDetails businessDetails;

  VerificationController() {
    showBusinessDetails();
  }

  Future<void> showBusinessDetails() async {
    isLoading = true;
    isDownloaded = false;
    notifyListeners();

    try {
      final infoBox = await Hive.openBox('info');
      String idToken = await infoBox.get('idToken');
      var response = await http.get(
        'http://finhelp-api.herokuapp.com/register/get-msmedata/',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'X-AUTH': idToken
        },
      );
      if (response.statusCode == 200) {
        businessDetails = BusinessDetails.fromJson(jsonDecode(response.body));
        notifyListeners();
      } else {
        print("Here");
        isLoading = false;
        notifyListeners();
      }
    } catch (err) {
      print("Here catch");
    }

    isLoading = false;
    notifyListeners();
  }

  Future<bool> generatePdf(String path) async {
    try {
      print("Generating PDF....");
      final pw.Document pdf = pw.Document();
      pdf.addPage(
        pw.Page(build: (context) {
          return pw.Center(
              child: pw.Column(children: [
            pw.Text("AID : " + businessDetails.aID,
                style: pw.TextStyle(fontSize: 20)),
            pw.Text("Enterprise Name : " + businessDetails.enterpriseName,
                style: pw.TextStyle(fontSize: 20)),
            pw.Text("Social Category : " + businessDetails.socialCategory,
                style: pw.TextStyle(fontSize: 20)),
            pw.Text("Gender : " + businessDetails.gender,
                style: pw.TextStyle(fontSize: 20)),
            pw.Text("Organisation Type : " + businessDetails.organisationType,
                style: pw.TextStyle(fontSize: 20)),
            pw.Text("Plant Location : " + businessDetails.plantLocation,
                style: pw.TextStyle(fontSize: 20)),
            pw.Text("Address : " + businessDetails.aID,
                style: pw.TextStyle(fontSize: 20)),
            pw.Text("State : " + businessDetails.state,
                style: pw.TextStyle(fontSize: 20)),
            pw.Text("District : " + businessDetails.district,
                style: pw.TextStyle(fontSize: 20)),
            pw.Text("PIN Code : " + businessDetails.pINCode,
                style: pw.TextStyle(fontSize: 20)),
            pw.Text("Commence Date : " + businessDetails.commmenceDate,
                style: pw.TextStyle(fontSize: 20)),
            pw.Text("Major Activity : " + businessDetails.majorActivity,
                style: pw.TextStyle(fontSize: 20)),
            pw.Text("Enterprise Type : " + businessDetails.enterpriseType,
                style: pw.TextStyle(fontSize: 20)),
            pw.Text("NIC5 Digit Code : " + businessDetails.nIC5DigitCode,
                style: pw.TextStyle(fontSize: 20)),
            pw.Text("Registration Date : " + businessDetails.registrationDate,
                style: pw.TextStyle(fontSize: 20)),
          ], mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly));
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
