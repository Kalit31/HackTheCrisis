import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hackthecause/utils/Constants.dart';
import 'package:hackthecause/utils/Routes.dart';
import 'package:hackthecause/utils/customTextWidget.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../authController.dart';

class SignUpStep2 extends StatefulWidget {
  @override
  _LoginStep2State createState() => _LoginStep2State();
}

class _LoginStep2State extends State<SignUpStep2> {
  final aidController = TextEditingController();
  final panController = TextEditingController();
  final aadharController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  void dispose() {
    aidController.dispose();
    panController.dispose();
    aadharController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        minimum: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        child: SingleChildScrollView(
          child: Container(
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
                Text("Step 2 of 3", style: loginHeadingText),
                Divider(
                  height: MediaQuery.of(context).size.height * 0.1,
                  color: Colors.transparent,
                ),
                CustomTextWidget(
                  value: "Enter AID",
                  controller: aidController,
                  type: "N",
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                CustomTextWidget(
                  value: "Enter PAN Number",
                  controller: panController,
                  type: "T",
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                CustomTextWidget(
                  value: "Enter Aadhar Number",
                  controller: aadharController,
                  type: "N",
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                CustomTextWidget(
                  value: "Enter Phone Number",
                  controller: phoneController,
                  type: "N",
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
                    String aid = aidController.text;
                    String panNumber = panController.text;
                    String aadharNumber = aadharController.text;
                    String phoneNum = phoneController.text;

                    if (aid.isNotEmpty &&
                        panNumber.isNotEmpty &&
                        aadharNumber.isNotEmpty &&
                        phoneNum.isNotEmpty &&
                        phoneNum.length == 10) {
                      final infoBox = await Hive.openBox('info');
                      infoBox.put('AID', aid);
                      infoBox.put('panNumber', panNumber);
                      infoBox.put('aadharNumber', aadharNumber);
                      infoBox.put('phoneNum', phoneNum);
                      final controller =
                          Provider.of<AuthController>(context, listen: false);
                      controller.verifySME().then((val) {
                        if (val) {
                          Routes.sailor('/phoneVerify');
                        } else {
                          Fluttertoast.showToast(
                            msg: "You are not registered as an SME",
                            toastLength: Toast.LENGTH_SHORT,
                          );
                        }
                      }).catchError((err) {
                        Fluttertoast.showToast(
                          msg: "Verification failed.",
                          toastLength: Toast.LENGTH_SHORT,
                        );
                      });
                    } else {
                      Fluttertoast.showToast(
                        msg:
                            "Please enter all details or check entered phone number",
                        toastLength: Toast.LENGTH_SHORT,
                      );
                    }
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
