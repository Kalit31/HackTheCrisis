import 'package:flutter/material.dart';
import 'package:hackthecause/utils/Constants.dart';
import 'package:hackthecause/utils/customTextWidget.dart';
import 'package:provider/provider.dart';

import 'verificationController.dart';

class BusinessDetails extends StatefulWidget {
  @override
  _BusinessDetailsState createState() => _BusinessDetailsState();
}

class _BusinessDetailsState extends State<BusinessDetails> {
  final businameController = TextEditingController();
  final aidController = TextEditingController();
  final districtController = TextEditingController();
  final stateController = TextEditingController();

  @override
  void dispose() {
    businameController.dispose();
    aidController.dispose();
    districtController.dispose();
    stateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<VerificationController>(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        minimum: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        child: SingleChildScrollView(
          child: controller.isProcessing
              ? ProcessingScreen()
              : Container(
                  child: Column(
                    children: <Widget>[
                      Divider(
                        color: Colors.transparent,
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Color(0xff4C46D3),
                          ),
                        ),
                      ),
                      Text(
                        "Business Details",
                        style: TextStyle(
                            color: Color(0xff4C46D3),
                            fontFamily: "Poppins",
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      Divider(
                        height: MediaQuery.of(context).size.height * 0.05,
                        color: Colors.transparent,
                      ),
                      Text(
                        "All details should be the same as mentioned during the MSME registration",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xff4C46D3), fontFamily: "Poppins"),
                      ),
                      Divider(
                        height: MediaQuery.of(context).size.height * 0.05,
                        color: Colors.transparent,
                      ),
                      CustomTextWidget(
                        value: "Business Name",
                        controller: businameController,
                        type: "T",
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1),
                      CustomTextWidget(
                        value: "AID",
                        controller: aidController,
                        type: "N",
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1),
                      CustomTextWidget(
                        value: "District",
                        controller: districtController,
                        type: "T",
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1),
                      CustomTextWidget(
                        value: "State",
                        controller: stateController,
                        type: "T",
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      GestureDetector(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            margin: EdgeInsets.only(
                                right: MediaQuery.of(context).size.width * 0.2),
                            decoration: loginButtonDecoration,
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: Center(
                              child: Text("Next", style: loginButtonText),
                            ),
                          ),
                        ),
                        onTap: () async {
                          await controller.verify();
                        },
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

class ProcessingScreen extends StatefulWidget {
  @override
  _ProcessingScreenState createState() => _ProcessingScreenState();
}

class _ProcessingScreenState extends State<ProcessingScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: <Widget>[
          Image.asset('images/loading.png'),
          Divider(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Text(
            "Please Wait",
            style: TextStyle(
                color: Color(0xff4C46D3),
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
                fontSize: 25),
          ),
          Text(
            "Your details are being processed. Might take a few minutes.",
            style: TextStyle(
                color: Color(0xff4C46D3), fontFamily: "Poppins", fontSize: 20),
            textAlign: TextAlign.center,
          )
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
