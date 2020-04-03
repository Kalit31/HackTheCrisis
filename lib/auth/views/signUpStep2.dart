import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hackthecause/utils/Constants.dart';
import 'package:hackthecause/utils/Routes.dart';
import 'package:hive/hive.dart';

class SignUpStep2 extends StatefulWidget {
  @override
  _LoginStep2State createState() => _LoginStep2State();
}

class _LoginStep2State extends State<SignUpStep2> {
  final emailController = TextEditingController();
  final gstController = TextEditingController();
  final aadharController = TextEditingController();
  final phoneController = TextEditingController();

  String email = "";
  String gstNumber = "";
  String aadharNumber = "";
  String phoneNum = "";

  @override
  void dispose() {
    emailController.dispose();
    gstController.dispose();
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
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "Enter Email",
                    ),
                    controller: emailController,
                    showCursor: true,
                    style: loginInputText,
                  ),
                  height: 30,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "Enter GST Number",
                    ),
                    controller: gstController,
                    showCursor: true,
                    style: loginInputText,
                  ),
                  height: 30,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Enter Aadhar Number",
                    ),
                    controller: aadharController,
                    showCursor: true,
                    style: loginInputText,
                  ),
                  height: 30,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Enter Phone Number",
                    ),
                    controller: phoneController,
                    showCursor: true,
                    style: loginInputText,
                  ),
                  height: 30,
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
                    email = emailController.text;
                    gstNumber = gstController.text;
                    aadharNumber = aadharController.text;
                    phoneNum = phoneController.text;
                    if (email.isNotEmpty &&
                        gstNumber.isNotEmpty &&
                        aadharNumber.isNotEmpty &&
                        phoneNum.isNotEmpty) {
                      final infoBox = await Hive.openBox('info');
                      infoBox.put('email', email);
                      infoBox.put('gstNumber', gstNumber);
                      infoBox.put('aadharNumber', aadharNumber);
                      infoBox.put('phoneNum', phoneNum);
                      infoBox.close();
                      Routes.sailor('/phoneVerify');
                    } else {
                      Fluttertoast.showToast(
                        msg: "Please enter all details",
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
