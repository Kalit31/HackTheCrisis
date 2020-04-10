import 'package:flutter/material.dart';
import 'package:hackthecause/utils/Constants.dart';

class EligibilityGuidlines extends StatefulWidget {
  @override
  _EligibilityGuidlinesState createState() => _EligibilityGuidlinesState();
}

class _EligibilityGuidlinesState extends State<EligibilityGuidlines> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ListView.builder(
        itemBuilder: ((BuildContext ctxt, int index) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              eligibiltyGuideLines[index],
              style: TextStyle(fontFamily: "Poppins", fontSize: 20),
            ),
          );
        }),
        itemCount: eligibiltyGuideLines.length,
      )),
    );
  }
}
