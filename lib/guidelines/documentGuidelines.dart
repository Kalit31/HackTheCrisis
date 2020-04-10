import 'package:flutter/material.dart';
import 'package:hackthecause/utils/Constants.dart';

class DocumentGuideLines extends StatefulWidget {
  @override
  _DocumentGuideLinesState createState() => _DocumentGuideLinesState();
}

class _DocumentGuideLinesState extends State<DocumentGuideLines> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ListView.builder(
        itemBuilder: ((BuildContext ctxt, int index) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              documentGuideLines[index],
              style: TextStyle(fontFamily: "Poppins", fontSize: 20),
            ),
          );
        }),
        itemCount: documentGuideLines.length,
      )),
    );
  }
}
