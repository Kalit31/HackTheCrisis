import 'package:flutter/material.dart';

TextStyle welcomeText =
    TextStyle(fontSize: 30, fontFamily: "Poppins", fontWeight: FontWeight.bold);

TextStyle loginHeadingText = TextStyle(
    fontSize: 30,
    color: Color(0xff4C46D3),
    fontFamily: "Poppins",
    fontWeight: FontWeight.bold);

TextStyle loginTextInfo = TextStyle(
    color: Colors.black, fontFamily: "Poppins", fontWeight: FontWeight.bold);

TextStyle loginButtonText = TextStyle(
  color: Colors.white,
  fontSize: 20,
  fontFamily: "Poppins",
);

TextStyle normalBlackStyle =
    TextStyle(color: Colors.black, fontFamily: "Poppins");

TextStyle linkTextStyle = TextStyle(
    color: Color(0xff4C46D3),
    fontFamily: "Poppins",
    fontWeight: FontWeight.w700);

TextStyle loginInputText =
    TextStyle(color: Colors.black, fontFamily: "Poppins");

BoxDecoration loginButtonDecoration = BoxDecoration(
    color: Color(0xff4C46D3),
    borderRadius: BorderRadius.all(Radius.circular(30)));

List<String> eligibiltyGuideLines = [
  "1. Local businessman or self employed people with annual income less than 1 lacs.",
  "2. Credit score less than 800 (optional).",
  "3. Proper Income Tax details, any discrepancy or previous discrepancy not eligible.",
  "4. Proper business records and invoice required (basically to make sure no surplus of black money)",
];

List<String> documentGuideLines = [
  "1. Documents should be scanned or a photograph should be clicked.",
  "2. Only original documents to be uploaded, any discrepancy will lead to direct rejection.",
  "3. Application will be considered only after all the required documents are uploaded."
];
